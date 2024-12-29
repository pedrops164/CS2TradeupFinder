import React, { useEffect, useState } from 'react';
import { handleApiError } from '../../utils/apiErrorHandler';
import '../../styles/TradeupCalculator.css';
import TradeupStats from './TradeupStats';
import TradeupInputEntry from './TradeupInputEntry';
import TradeupInputEntryForm from './TradeupInputEntryForm';
import { getSkinCondition } from '../../utils/helperFunctions';
import TradeupOutputEntry from './TradeupOutputEntry';

const TradeupCalculator = (userRole) => {

    // SET STATES
    // State to manage skins data
    const [skins, setSkins] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    // state to manage tradeup stattrak status
    const [isStattrak, setIsStattrak] = useState(false);

    // Pool of rarity strings for the dropdown
    const rarityOptions = ["consumer_bg", "industrial_bg", "milspec_bg", "restricted_bg", "classified_bg", "covert_bg"];

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
    // type of the tradeup to add (public or purchasable)
    const [tradeupType, setTradeupType] = useState(null);

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
    // Fetch skin data on component mount
    useEffect(() => {
        const fetchSkins = async () => {
            try {
                const response = await fetch('load-all-skins');
                if (!response.ok) {
                    const errorMessage = await handleApiError(response);
                    setError(errorMessage);
                    setLoading(false);
                    return;
                }
                const data = await response.json();
                setSkins(data.all_skins);
                setLoading(false);
            } catch (err) {
                console.error('Failed to fetch skins data: ', err);
                setError('Failed to load skins data');
                setLoading(false);
            }
        };

        fetchSkins();
    }, []);

    // Update the disabled status of the Add Tradeup button based on input entry count
    useEffect(() => {
        setIsAddTradeupDisabled(getInputEntryCount() !== 10);
    }, [inputEntries]);

    // Handle stattrak change with validation
    const handleStattrakChange = (e) => {
        const newStattrakValue = e.target.checked;
        // Check if all current input entries support stattrak
        if (newStattrakValue && inputEntries.length > 0) {
            const allStattrakAvailable = inputEntries.every(entry => {
                const matchingSkin = skins.find(skin => skin.skin_name === entry.skin_name);
                return matchingSkin && matchingSkin.stattrak_available;
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
                rarity: selectedRarity
            };

            // Make the request to the route
            const response = await fetch('/tradeups/calculate_output', {
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

    const getInputEntryCount = () => {
        // Sum up the count of all input entries to get the total count, and return it
        const totalCount = inputEntries.reduce((prev, current) => {
            prev += current.count;
            return prev;
        }, 0);
        return totalCount;
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
            const matchingSkin = skins.find(skin => skin.skin_name === entry.skin_name);
            return matchingSkin && matchingSkin.rarity === selectedRarity;
        });

        if (!allSameRarity) {
            setValidationError('All items must be of the same rarity');
            return false;
        }

        if (isStattrak) {
            const allStattrakAvailable = inputEntries.every(entry => {
                const matchingSkin = skins.find(skin => skin.skin_name === entry.skin_name);
                return matchingSkin && matchingSkin.stattrak_available;
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
            const response = await fetch('/tradeups/check_duplicate', {
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
                    rarity: selectedRarity
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
            input_entries: inputEntries,
            output_entries: outputEntries
        };

        console.log("payload:", payload);

        // get api route
        let route = '';
        if (tradeupType === 'public') {
            route = '/tradeups/create_public';
        } else if (tradeupType === 'purchasable') {
            route = '/tradeups/create_purchasable';
        } else if (tradeupType === 'private') {
            route = '/tradeups/create_private';
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

            const data = await response.json();
            console.log('Tradeup added successfully!');
            alert('Tradeup added successfully!');
        } catch (error) {
            console.log('Error happened while handling add tradeup:', error);
            setValidationError('Failed to add tradeup. Please try again.');
        }
    }

    return (
        <div className="tradeup-calculator">
            <h1>Tradeup Calculator</h1>
            <div className="stattrak-checkbox">
                <label>
                    Stattrak
                    <input 
                    type="checkbox"
                    checked={isStattrak}
                    onChange={handleStattrakChange}
                    />
                </label>
            </div>

            <div className="rarity-dropdown">
                <label htmlFor='rarityDropdown'>Rarity</label>
                <select
                id="rarityDropdown"
                value={selectedRarity}
                onChange={handleRarityChange}
                >
                {rarityOptions.map((rarityOption, index) => (
                    <option key={index} value={rarityOption}>
                        {rarityOption}
                    </option>
                ))}
                </select>
            </div>

            <TradeupStats avgInputFloat={avgInputFloat} tradeupCost={tradeupCost} profitability={profitability} profitOdds={profitOdds}/>

            {/* Section for input and output containers */}
            {loading ? (
                <p>Loading skins...</p>
            ) : error ? (
                <p>{error}</p>
            ) : (
                <div className="input-output-container">
                    <div className="input-container">
                        <h4>Input Entries
                            <TradeupInputEntryForm skinsData={skins} addEntry={addInputEntry} isStattrak={isStattrak} selectedRarity={selectedRarity} />
                        </h4>

                        {/* Display errors */}
                        {inputEntryError && <div className='error-msg'>{inputEntryError}</div>}
                        {validationError && <div className='error-msg'>{validationError}</div>}

                        {inputEntries.map((entry, index) => (
                            <TradeupInputEntry
                                index={index}
                                skin_name={entry.skin_name}
                                skin_float={entry.skin_float}
                                count={entry.count}
                                image_url={entry.image_url}
                                removeEntry={removeEntry}
                            />
                        ))}
                    </div>
    
                    <div className="output-container">
                        <h4>Output Entries</h4>
                        {outputEntries.map((entry, index) => (
                            <TradeupOutputEntry
                                index={index}
                                skin_name={entry.skin_name}
                                skin_float={entry.skin_float}
                                skin_prob={entry.prob}
                                image_url={entry.image_url}
                            />
                        ))}
                    </div>
                    {userRole.user_role === 'admin' && (
                        <div className="admin-options">
                        <h3>Admin Options</h3>
                        
                        {/* Dropdown to choose the type of tradeup (public or purchasable) */}
                        {/*}
                        This is commented out because we are only supporting public tradeups for now
                        <select onChange={(e) => setTradeupType( e.target.value )} defaultValue="">
                            <option value="" disabled hidden>Choose tradeup type</option>
                            <option value="public">Public Tradeup</option>
                            <option value="purchasable">Purchasable Tradeup</option>
                        </select>
                        */}

                        {/* Button to add tradeup to database */}
                        {/* <button onClick={() => handleAddTradeup(tradeupType)} disabled={isAddTradeupDisabled || tradeupType===null}> */}
                        <button onClick={() => handleAddTradeup('public')} disabled={isAddTradeupDisabled}>
                            Add Tradeup
                        </button>
                        </div>
                    )}

                    {userRole.user_role === 'user' && (
                        <div className="user-options">
                        <button onClick={() => handleAddTradeup('private')} disabled={isAddTradeupDisabled}>
                            Track Tradeup
                        </button>
                        </div>
                    )}
                </div>
            )}

        </div>
    );
};

export default TradeupCalculator;