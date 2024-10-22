import React, { useEffect, useState } from 'react';
import '../../styles/TradeupCalculator.css';
import TradeupStats from './TradeupStats';
import TradeupInputEntry from './TradeupInputEntry';
import TradeupInputEntryForm from './TradeupInputEntryForm';
import { getSkinCondition } from '../../utils/helperFunctions';
import TradeupOutputEntry from './TradeupOutputEntry';

const TradeupCalculator = () => {

    // State to manage skins data
    const [skins, setSkins] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    // Fetch skin data on component mount
    useEffect(() => {
        const fetchSkins = async () => {
            try {
                const response = await fetch('load-all-skins');
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

    // state to manage tradeup stattrak status
    const [isStattrak, setIsStattrak] = useState(false);

    // Pool of rarity strings for the dropdown
    const rarityOptions = ["consumer_bg", "industrial_bg", "milspec_bg", "restricted_bg", "classified_bg", "covert_bg"];

    // state to manage chosen rarity for the tradeup
    const [selectedRarity, setSelectedRarity] = useState(rarityOptions[0]);

    // Handle stattrak change
    const handleStattrakChange = (e) => {
        setIsStattrak(e.target.checked);
    };

    // Handle rarity change
    const handleRarityChange = (e) => {
        setSelectedRarity(e.target.value);
    };

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
            collection_id: selectedSkin.collection_id
        };
        console.log('entry: ', entry);
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
            let stattrak_str = isStattrak ? "stattrak" : "non_stattrak";
            let skin_price = input_entry.conditions[skin_condition][stattrak_str];
            let new_entry = {
                count: input_entry.count,
                skin_float: input_entry.skin_float,
                price: skin_price,
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
                } else {
                    console.log('Tradeup Output:', result);
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

            console.log("requestData - ", requestData);
            
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
                throw new Error(`HTTP error! status: ${response.status}`);
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
            console.error('Error occurred while calculating tradeup output:', err);
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

                        {/*display error*/}
                        {inputEntryError && <div className='error-msg'>{inputEntryError}</div>}

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
                </div>
            )}

        </div>
    );
};

export default TradeupCalculator;