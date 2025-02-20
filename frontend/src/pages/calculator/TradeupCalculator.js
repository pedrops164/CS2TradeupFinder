import React, { useEffect, useState, useCallback } from 'react';
import { handleApiError } from '../../utils/apiErrorHandler';
import TradeupStats from './tradeup-stats/TradeupStats';
import TradeupInputEntry from './TradeupInputEntry';
import TradeupInputEntryForm from './TradeupInputEntryForm';
import { getSkinCondition } from '../../utils/helperFunctions';
import TradeupOutputEntry from './TradeupOutputEntry';
import { TradeupTypeEnum } from './TradeupTypeEnum';
import TradeupInputEntryFormNew from './TradeupInputEntryFormNew';
import { useApi } from '../../contexts/ApiProvider';
import { useUser } from '../../contexts/UserProvider';

// mui imports
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import Button from '@mui/material/Button';
import Box from '@mui/material/Box';
import { FormControl, FormControlLabel, FormGroup, TextField } from '@mui/material';
import Switch from '@mui/material/Switch';
import Select from '@mui/material/Select';
import MenuItem from '@mui/material/MenuItem';
import { DateTimePicker } from '@mui/x-date-pickers/DateTimePicker';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import dayjs from 'dayjs';
import { rarityOptions } from '../../utils/helperFunctions';

const TradeupCalculator = () => {
    const { user } = useUser();

    // SET STATES
    // state to manage tradeup stattrak status
    const [isStattrak, setIsStattrak] = useState(false);

    // state to manage chosen rarity for the tradeup
    const [selectedRarity, setSelectedRarity] = useState(rarityOptions[0][0]);

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

    // New state for the release date (for admin only)
    const [releaseDate, setReleaseDate] = useState(dayjs());

    const api = useApi();

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
        // e is the rarity string, NOT the array (e.g. "consumer_bg", instead of ["consumer_bg", "Consumer Grade"])
        setSelectedRarity(e.target.value);
        clearTradeup();
    };

    // handle add input entry button
    const addInputEntry = (selectedSkin, skin_float, count, skinCondition, skinPrice) => {
        // Receives the parameters of the TradeupInputEntryForm, error checks them (displays msg if error), and adds 
        //   entry to list of added entries.
        // Returns false if error, true if added successfully

        const newEntryCount = getInputEntryCount() + count;

        // error checking
        if (!selectedSkin) {
            setInputEntryError('Must select a skin!');
            return false;
        } else if (isNaN(skin_float) || isNaN(count)) {
            setInputEntryError('Either skin float or count are invalid!');
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
            skin_condition_id: selectedSkin.skin_condition_id,
            image_url: selectedSkin.image_url,
            conditions: selectedSkin.conditions,
            collection_id: selectedSkin.collection_id,
            skin_condition: skinCondition,
            stattrak_available: selectedSkin.stattrak_available,
            rarity: selectedSkin.rarity,
            skin_price: skinPrice
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

            let stattrak_str = isStattrak ? "stattrak" : "non_stattrak";
            let skin_condition_id = input_entry.conditions[input_entry.skin_condition][stattrak_str]['skin_condition_id'];
            let new_entry = {
                count: input_entry.count,
                skin_float: input_entry.skin_float,
                skin_condition_id: skin_condition_id,
            };
            input_entries.push(new_entry);
        });

        // calculate tradeup output
        calculateTradeupOutput(input_entries)
            .then((result) => {
                if (result.error) {
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
        // Prepare the request data
        const requestData = {
            input_entries: input_entries,
            stattrak: isStattrak,
            input_rarity: selectedRarity
        };

        // Make the request to the route
        const response = await api.post('/tradeups/calculate_output', requestData);

        // Handle non-200 HTTP responses
        if (!response.ok) {
            return {
                error: 'Failed to calculate tradeup output. Please try again later.'
            };
        }

        // Parse the JSON response
        const data = response.body;

        return {
            output_entries: data.output,
            avg_input_float: data.avg_input_float,
            tradeup_cost: data.tradeup_cost,
            profit_avg: data.profit_avg,
            profit_odds: data.profit_odds
        };
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

        let stattrak_str = isStattrak ? "stattrak" : "non_stattrak";
        // create payload
        const payload = {
            stattrak: isStattrak,
            input_rarity: selectedRarity,
            input_entries: inputEntries.map((entry, _) => ({
                "skin_float": entry.skin_float,
                "count": entry.count,
                "skin_condition_id": entry.conditions[entry.skin_condition][stattrak_str]['skin_condition_id']
            }))
        };
        // Check for duplicate tradeup
        const response = await api.post('/tradeups/check_duplicate', {...payload, tradeup_type: tradeupType});

        // Handle non-200 HTTP responses
        if (!response.ok) {
            const errorMessage = await handleApiError(response);
            setValidationError(errorMessage);
            return;
        }

        const duplicateCheck = response.body;
        if (duplicateCheck.is_duplicate) {
            setValidationError('This tradeup already exists');
            return;
        }


        // If admin selected a release date, include it in the payload
        if (user.role === 'admin' && releaseDate) {
            payload.release_date = releaseDate.toISOString();
        }

        // get api route
        let route = '';
        let msg;
        if (tradeupType === 'public') {
            route = '/tradeups/create_public';
            msg = 'Public Tradeup created successfully!';
        } else if (tradeupType === 'purchasable') {
            msg = 'Purchasable Tradeup created successfully!';
            route = '/tradeups/create_purchasable';
        } else if (tradeupType === 'private') {
            msg = 'Tradeup tracked successfully!';
            route = '/tradeups/create_private';
        }

        // make api call with payload
        const add_tradeup_response = await api.post(route, payload);

        if (!add_tradeup_response.ok) {
            const errorMessage = await handleApiError(add_tradeup_response);
            setValidationError(errorMessage);
            return;
        }

        alert(msg);
    }

    return (
        <Box
            sx={(theme) => ({
                height: '100vh',
                overflowY: 'auto',
                backgroundColor: theme.palette.background.default, // uses theme background color
            })}
            >
            <Box
                sx={{
                    display: 'flex',
                    flexDirection: 'column',
                }}>
                <Typography variant="h4" component="h1"
                  sx={(theme) => ({
                    color: theme.palette.text.primary,
                    m: 2,
                  })}>
                    Tradeup Calculator 
                </Typography>
                
                <Box sx={{display: 'flex', flexDirection: 'row', alignItems: 'center', mb: '10px'}} >
                    <FormGroup sx={{ml: 3}}>
                        <FormControlLabel 
                        control={
                        <Switch checked={isStattrak} 
                                onChange={handleStattrakChange} 
                                color="secondary"/>}
                        label="StatTrak™"
                        sx={(theme) => ({
                            color: theme.palette.text.primary
                          })}/>
                    </FormGroup>

                    <FormControl>
                        <Select 
                            value={selectedRarity}
                            onChange={handleRarityChange}
                            >
                            {rarityOptions.map((rarityOption, index) => (
                                <MenuItem key={index} value={rarityOption[0]}>
                                    {rarityOption[1]}
                                </MenuItem>
                            ))}
                            </Select>
                    </FormControl>
                </Box>

                <TradeupStats avgInputFloat={avgInputFloat} tradeupCost={tradeupCost} profitability={profitability} profitOdds={profitOdds}/>

                {/* Section for input and output containers */}
                <Box sx={{display: 'flex', justifyContent: 'space-between', flex: '1 0 1'}}>
                    <Card variant="outlined"
                            sx={{ 
                                m: 2, 
                                flex: 1, 
                                borderRadius: 2,
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
                                            skin_price={entry.skin_price}
                                        />
                                    </ListItem>
                                ))}
                            </List>
                        </CardContent>
                    </Card>

                    <Card variant="outlined" 
                            sx={{ 
                                m: 2, 
                                flex: 1, 
                                borderRadius: 2,
                            }}>
                        <CardHeader title="Output Entries" action={
                            <>
                                {user.role === 'admin' && (
                                    <Box sx={{ display: 'flex', flexDirection: 'row', alignItems: 'center' }}>
                                        <LocalizationProvider dateAdapter={AdapterDayjs}>
                                            <DateTimePicker
                                                label="Release Date & Time"
                                                value={releaseDate}
                                                onChange={(newDate) => setReleaseDate(newDate)}
                                                sx={{mr: 2, ml: 1}}
                                            />
                                        </LocalizationProvider>
                                        <Button onClick={() => handleAddTradeup(TradeupTypeEnum.PUBLIC)} disabled={isAddTradeupDisabled} variant="contained" bgcolor="text.primary" >
                                            Add Tradeup
                                        </Button>
                                    </Box>
                                )}
                                {user.role === 'user' && (
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
                                            skin_name={entry.skin_name}
                                            skin_float={entry.skin_float}
                                            skin_prob={entry.prob}
                                            image_url={entry.image_url}
                                            skin_price={entry.price}
                                        />
                                    </ListItem>
                                ))}
                            </List>
                        </CardContent>
                    </Card>
                </Box>
            </Box>
        </Box>
    );
};

export default TradeupCalculator;