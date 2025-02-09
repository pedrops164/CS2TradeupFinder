import React, { useEffect, useState, useCallback } from 'react';
import { handleApiError } from '../../utils/apiErrorHandler';
import '../../styles/TradeupCalculator.css';
import TradeupStats from './tradeup-stats/TradeupStats';
import TradeupInputEntry from './TradeupInputEntry';
import TradeupInputEntryForm from './TradeupInputEntryForm';
import { getSkinCondition } from '../../utils/helperFunctions';
import TradeupOutputEntry from './TradeupOutputEntry';
import { TradeupTypeEnum } from './TradeupTypeEnum';

// mui imports
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import Button from '@mui/material/Button';
import { ThemeProvider, createTheme } from '@mui/material/styles';

const theme = createTheme({
    palette: {
        primary: {
            main: '#000000',  // Primary color for the app
        },
        secondary: {
            main: '#262626',  // Secondary color for the app
        },
        text: {
            primary: '#ffffff',
            secondary: '#979797',
        },
    },
    components: {
        MuiCard: {
            styleOverrides: {
                root: {
                    backgroundColor: '#000000',  // Use the theme's paper background
                    color: '#ffffff',            // Ensure text is white by default
                    border: '1px solid #ffffff', // For example, set a default border color
                },
            },
        },
        MuiCardHeader: {
            styleOverrides: {
                root: {
                    color: '#ffffff',  // Set the header text color
                },
            },
        },
        MuiTypography: {
            styleOverrides: {
                root: {
                    color: '#ffffff',  // Default typography color
                },
            },
        },
    },
});

const TradeupCalculator = (userRole) => {

    // SET STATES
    // state to manage tradeup stattrak status
    const [isStattrak, setIsStattrak] = useState(false);

    // Pool of rarity strings for the dropdown
    const rarityOptions = [
        ["consumer_bg", "Consumer Grade"],
        ["industrial_bg", "Industrial Grade"],
        ["milspec_bg", "Mil-Spec"],
        ["restricted_bg", "Restricted"],
        ["classified_bg", "Classified"],
        ["covert_bg", "Covert"]
    ];

    // state to manage chosen rarity for the tradeup
    const [selectedRarity, setSelectedRarity] = useState(rarityOptions[0]);

    // state to manage Average Input Float
    const [avgInputFloat, setAvgInputFloat] = useState(0);
    // state to manage Tradeup Cost
    const [tradeupCost, setTradeupCost] = useState(0);
    // state to manage Profitability
    const [profitability, setProfitability] = useState(0);
    // state to manage Profit Odds
    const [profitOdds, setProfitOdds] = useState(0);

    // Input entries
    const [inputEntries, setInputEntries] = useState([]);

    // Output entries
    const [outputEntries, setOutputEntries] = useState([]);

    // error variable for showing error messages
    const [inputEntryError, setInputEntryError] = useState('');
    const [validationError, setValidationError] = useState('');

    // State to manage the disabled status of the Add Tradeup button
    const [isAddTradeupDisabled, setIsAddTradeupDisabled] = useState(true);

    // Utility function to clear all tradeup-related states
    const clearTradeup = () => {
        setInputEntries([]);
        setOutputEntries([]);
        setAvgInputFloat(0);
        setTradeupCost(0);
        setProfitability(0);
        setProfitOdds(0);
        setInputEntryError('');
        setValidationError('');
    };

    const getInputEntryCount = useCallback(() => {
        // Sum up the count of all input entries to get the total count, and return it
        const totalCount = inputEntries.reduce((prev, current) => {
            prev += current.count;
            return prev;
        }, 0);
        return totalCount;
    }, [inputEntries]);

    // Update the disabled status of the Add Tradeup button based on input entry count
    useEffect(() => {
        setIsAddTradeupDisabled(getInputEntryCount() !== 10);
    }, [getInputEntryCount]);

    // Handle stattrak change with validation
    const handleStattrakChange = (e) => {
        const newStattrakValue = e.target.checked;
        // Check if all current input entries support stattrak
        if (newStattrakValue && inputEntries.length > 0) {
            const allStattrakAvailable = inputEntries.every(entry => {
                //const matchingSkin = skins.find(skin => skin.skin_name === entry.skin_name);
                //return matchingSkin && matchingSkin.stattrak_available;
                return entry.stattrak_available;
            });
            if (!allStattrakAvailable) {
                setValidationError('One or more selected skins do not support StatTrak™');
                return;
            }
        }
        setIsStattrak(newStattrakValue);
        setValidationError('');
    };

    // Handle rarity change and clear tradeup
    const handleRarityChange = (e) => {
        setSelectedRarity(e.target.value);
        clearTradeup();
    };

    // handle add input entry button
    const addInputEntry = (selectedSkin, skin_float, count) => {
        // Receives the parameters of the TradeupInputEntryForm, error checks them (displays msg if error), and adds 
        //   entry to list of added entries.
        // Returns false if error, true if added successfully

        const newEntryCount = getInputEntryCount() + count;

        // error checking
        if (!selectedSkin) {
            setInputEntryError('Must select a skin!');
            return false;
        } else if (skin_float < selectedSkin.min_float || skin_float > selectedSkin.max_float) {
            setInputEntryError('Float out of bounds!');
            return false;
        } else if (newEntryCount > 10) {
            setInputEntryError('Total input entry count is higher than 10');
            return false;
        } else if (count <= 0) {
            setInputEntryError('Count has invalid value');
            return false;
        }

        // no errors -> create entry
        const entry = {
            skin_name: selectedSkin.skin_name,
            skin_float: skin_float,
            count: count,
            image_url: selectedSkin.image_url,
            conditions: selectedSkin.conditions,
            collection_id: selectedSkin.collection_id,
            skin_condition: getSkinCondition(skin_float),
            stattrak_available: selectedSkin.stattrak_available,
            rarity: selectedSkin.rarity
        };
        // add input entry
        const updatedEntries = [...inputEntries, entry];
        setInputEntries(updatedEntries);
        // added entry successfully, se we clear errors and we return true
        setInputEntryError('');

        // check if total count is 10. This way we need to fetch the output skins of the tradeup and its stats, and update the output container
        if (newEntryCount === 10) {
            calculateTradeup(updatedEntries);
        }

        return true;
    };

    const calculateTradeup = (tradeupInputEntries) => {
        // calculate tradeup output from the inputs
        // calculate tradeup stats

        let input_entries = [];
        tradeupInputEntries.forEach(input_entry => {

            // get skin condition string from the value of the float
            let skin_condition = getSkinCondition(input_entry.skin_float);

            // fetch skin price
            //let stattrak_str = isStattrak ? "stattrak" : "non_stattrak";
            //let skin_price = input_entry.conditions[skin_condition][stattrak_str];
            let new_entry = {
                count: input_entry.count,
                skin_float: input_entry.skin_float,
                skin_condition: skin_condition,
                skin_name: input_entry.skin_name,
                collection_id: input_entry.collection_id
            };
            input_entries.push(new_entry);
        });

        // calculate tradeup output
        calculateTradeupOutput(input_entries)
            .then((result) => {
                if (result.error) {
                    console.log(result.error); // Handle error in UI if needed
                    setInputEntryError(result.error)
                } else {
                    setOutputEntries([...result.output_entries]);
                    setAvgInputFloat(result.avg_input_float);
                    setTradeupCost(result.tradeup_cost);
                    setProfitability(result.profit_avg);
                    setProfitOdds(result.profit_odds);
                    // Use the returned data
                }
            })
    }

    const calculateTradeupOutput = async (input_entries) => {
        try {
            // Prepare the request data
            const requestData = {
                input_entries: input_entries,
                stattrak: isStattrak,
                input_rarity: selectedRarity
            };

            // Make the request to the route
            const response = await fetch('/api/tradeups/calculate_output', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(requestData)
            });

            // Handle non-200 HTTP responses
            if (!response.ok) {
                const errorMessage = await handleApiError(response);
                return { error: errorMessage };
            }

            // Parse the JSON response
            const data = await response.json();

            return {
                output_entries: data.output,
                avg_input_float: data.avg_input_float,
                tradeup_cost: data.tradeup_cost,
                profit_avg: data.profit_avg,
                profit_odds: data.profit_odds
            };
        } catch (err) {
            return {
                error: 'Failed to calculate tradeup output. Please try again later.'
            };
        }
    }

    const removeEntry = (indexToRemove) => {
        // removes a specific input entry given its id
        setInputEntries(inputEntries.filter((_, index) => index !== indexToRemove));
    }

    // Validate tradeup requirements
    const validateTradeup = () => {
        if (getInputEntryCount() !== 10) {
            setValidationError('Tradeup must have exactly 10 items');
            return false;
        }

        const allSameRarity = inputEntries.every(entry => {
            //const matchingSkin = skins.find(skin => skin.skin_name === entry.skin_name);
            //return matchingSkin && matchingSkin.rarity === selectedRarity;
            return entry.rarity === selectedRarity;
        });

        if (!allSameRarity) {
            setValidationError('All items must be of the same rarity');
            return false;
        }

        if (isStattrak) {
            const allStattrakAvailable = inputEntries.every(entry => {
                //const matchingSkin = skins.find(skin => skin.skin_name === entry.skin_name);
                //return matchingSkin && matchingSkin.stattrak_available;
                return entry.stattrak_available;
            });

            if (!allStattrakAvailable) {
                setValidationError('All items must support StatTrak™ for a StatTrak™ tradeup');
                return false;
            }
        }

        return true;
    };

    const handleAddTradeup = async (tradeupType) => {
        setValidationError('');

        if (!validateTradeup()) {
            return;
        }

        // Check for duplicate tradeup
        try {
            const response = await fetch('/api/tradeups/check_duplicate', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    input_entries: inputEntries.map((entry, _) => ({
                        "skin_name": entry.skin_name,
                        "skin_float": entry.skin_float,
                        "count": entry.count,
                        "skin_condition": entry.skin_condition,
                        "collection_id": entry.collection_id
                    })),
                    stattrak: isStattrak,
                    input_rarity: selectedRarity,
                    tradeup_type: tradeupType
                })
            });

            // Handle non-200 HTTP responses
            if (!response.ok) {
                const errorMessage = await handleApiError(response);
                setValidationError(errorMessage);
                return;
            }

            const duplicateCheck = await response.json();
            if (duplicateCheck.is_duplicate) {
                setValidationError('This tradeup already exists');
                return;
            }
        } catch (error) {
            console.error('Error checking for duplicate tradeup:', error);
            setValidationError('Error checking for duplicate tradeup');
            return;
        }

        // create payload
        const payload = {
            stattrak: isStattrak,
            input_rarity: selectedRarity,
            input_entries: inputEntries.map((entry, _) => ({
                "skin_name": entry.skin_name,
                "skin_float": entry.skin_float,
                "count": entry.count,
                "skin_condition": entry.skin_condition,
                "collection_id": entry.collection_id
            }))
        };

        console.log("payload:", payload);

        // get api route
        let route = '';
        if (tradeupType === 'public') {
            route = '/api/tradeups/create_public';
        } else if (tradeupType === 'purchasable') {
            route = '/api/tradeups/create_purchasable';
        } else if (tradeupType === 'private') {
            route = '/api/tradeups/create_private';
        }

        // make api call with payload
        try {
            const response = await fetch(route, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(payload)
            });
    
            if (!response.ok) {
                const errorMessage = await handleApiError(response);
                setValidationError(errorMessage);
                return;
            }

            await response.json();
            console.log('Tradeup added successfully!');
            alert('Tradeup added successfully!');
        } catch (error) {
            console.log('Error happened while handling add tradeup:', error);
            setValidationError('Failed to add tradeup. Please try again.');
        }
    }

    return (
        <ThemeProvider theme={theme}>
            <div class="main">
                <div className="tradeup-calculator">
                    <h1>Tradeup Calculator</h1>
                    
                    <div className="stattrak-rarity-container">
                        <div className="stattrak-checkbox">
                            <label>
                                StatTrak™
                                <input 
                                type="checkbox"
                                checked={isStattrak}
                                onChange={handleStattrakChange}
                                />
                            </label>
                        </div>

                        <div className="rarity-dropdown">
                            <select
                            value={selectedRarity}
                            onChange={handleRarityChange}
                            >
                            {rarityOptions.map((rarityOption, index) => (
                                <option key={index} value={rarityOption[0]}>
                                    {rarityOption[1]}
                                </option>
                            ))}
                            </select>
                        </div>
                    </div>

                    <TradeupStats avgInputFloat={avgInputFloat} tradeupCost={tradeupCost} profitability={profitability} profitOdds={profitOdds}/>

                    {/* Section for input and output containers */}
                    <div className="input-output-container">
                        {/*<Card variant="outlined" className="input-container">*/}
                        <Card variant="outlined" 
                                sx={{ 
                                    m: 2, 
                                    flex: 1, 
                                    border: '2px solid',
                                    borderRadius: 2, 
                                    borderColor: 'text.primary', 
                                    bgcolor: 'primary.main' 
                                }}>
                            <CardHeader title="Input Entries" />
                            <CardContent>
                                {/* Render the input entry form */}
                                <TradeupInputEntryForm 
                                    addEntry={addInputEntry} 
                                    isStattrak={isStattrak} 
                                    selectedRarity={selectedRarity} 
                                />

                                {/* Display error messages using MUI Typography */}
                                {inputEntryError && (
                                    <Typography color="error" variant="body2" sx={{ mt: 1 }}>
                                        {inputEntryError}
                                    </Typography>
                                )}
                                {validationError && (
                                    <Typography color="error" variant="body2" sx={{ mt: 1 }}>
                                        {validationError}
                                    </Typography>
                                )}

                                {/* Use an MUI List to render each input entry */}
                                <List>
                                    {inputEntries.map((entry, index) => (
                                        <ListItem key={index} disablePadding>
                                            <TradeupInputEntry
                                                index={index}
                                                skin_name={entry.skin_name}
                                                skin_float={entry.skin_float}
                                                count={entry.count}
                                                image_url={entry.image_url}
                                                removeEntry={removeEntry}
                                            />
                                        </ListItem>
                                    ))}
                                </List>
                            </CardContent>
                        </Card>

                        {/*<Card variant="outlined" className="output-container">*/}
                        <Card variant="outlined" 
                                sx={{ 
                                    m: 2, 
                                    flex: 1, 
                                    border: '2px solid',
                                    borderRadius: 2, 
                                    borderColor: 'text.primary', 
                                    bgcolor: 'primary.main' 
                                }}>
                            <CardHeader title="Output Entries" action={
                                <>
                                    {userRole.user_role === 'admin' && (
                                        <Button onClick={() => handleAddTradeup(TradeupTypeEnum.PUBLIC)} disabled={isAddTradeupDisabled} variant="contained" bgcolor="text.primary">
                                            Add Tradeup
                                        </Button>
                                    )}
                                    {userRole.user_role === 'user' && (
                                        <Button onClick={() => handleAddTradeup(TradeupTypeEnum.PRIVATE)} disabled={isAddTradeupDisabled} variant="contained" bgcolor="text.primary">
                                            Track Tradeup
                                        </Button>
                                    )}
                                </>
                            } />
                            <CardContent>
                                <List>
                                    {outputEntries.map((entry, index) => (
                                        <ListItem key={index} disablePadding>
                                            <TradeupOutputEntry
                                                index={index}
                                                skin_name={entry.skin_name}
                                                skin_float={entry.skin_float}
                                                skin_prob={entry.prob}
                                                image_url={entry.image_url}
                                            />
                                        </ListItem>
                                    ))}
                                </List>
                            </CardContent>
                        </Card>
                    </div>
                </div>
            </div>
        </ThemeProvider>
    );
};

export default TradeupCalculator;