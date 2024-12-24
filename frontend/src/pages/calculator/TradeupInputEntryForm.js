import React, {useState, useEffect} from 'react';
import '../../styles/TradeupCalculator.css';

const TradeupInputEntryForm = ({ skinsData, addEntry, isStattrak, selectedRarity }) => {
    const [searchQuery, setSearchQuery] = useState('');
    const [filteredSkins, setFilteredSkins] = useState([]);
    const [selectedSkin, setSelectedSkin] = useState(null);
    const [minFloat, setMinFloat] = useState(0); // Default min float
    const [maxFloat, setMaxFloat] = useState(1); // Default max float
    const minCount = 1;
    const maxCount = 10;

    const [floatValue, setFloatValue] = useState(minFloat);
    const [count, setCountValue] = useState(minCount);

    useEffect(() => {
        if (searchQuery === '') {
            setFilteredSkins([]);
        } else {
            setFilteredSkins(
                skinsData.filter(
                    (skin) =>
                    skin.skin_name.toLowerCase().includes(searchQuery.toLowerCase()) &&
                    skin.rarity === selectedRarity && // Filter by selected rarity
                    (!isStattrak || skin.stattrak_available) // Check stattrak availability
                )
            );
        }
    }, [searchQuery, isStattrak, selectedRarity]);

    useEffect(() => {
        handleRemoveSkin();
    }, [isStattrak, selectedRarity]);

    const handleSkinSelect = (skin) => {
        setSelectedSkin(skin);
        //onChange(index, 'skinName', skin.name);
        setFilteredSkins([]);
        setSearchQuery('');
        setMinFloat(skin.min_float);
        setMaxFloat(skin.max_float);
    };

    const handleRemoveSkin = () => {
        setSelectedSkin(null);
        //onChange(index, 'skinName', '');
        setMinFloat(0); // Reset to default min float
        setMaxFloat(1); // Reset to default max float
    };

    // Validate and enforce float value within range
    const handleFloatChange = (e) => {
        let value = parseFloat(e.target.value);

        // If the value is outside of min/max bounds, clamp it
        if (value < minFloat) {
            value = minFloat;
        } else if (value > maxFloat) {
            value = maxFloat;
        }

        setFloatValue(value);
        //onChange(index, 'floatValue', value); // Ensure it's a fixed float precision
    };

    // Set default value of 1 for count if it's not set
    const handleCountChange = (e) => {
        let value = parseInt(e.target.value, 10);
        if (!isNaN(value)) {
            if (value < 1) {
                value = 1;
            } else if (value > 10) {
                value = 10;
            }
        }

        setCountValue(value);
        //onChange(index, 'count', value);
    };

    const addInputEntry = () => {
        const successfullyAdded = addEntry(selectedSkin, floatValue, count);
        if (successfullyAdded) {
            handleRemoveSkin();
            setFloatValue(0);
            setCountValue(1);
        }
    }

    return (
        <div className="entry-form">
            {selectedSkin ? (
                <div className='selected-skin'>
                    <span>{selectedSkin.skin_name}</span>
                    <img src={selectedSkin.image_url} className="skin-image" />
                    <button className='remove-skin-button' onClick={handleRemoveSkin}>X</button>
                </div>
            ) : (
                <>
                    <input
                        type="text"
                        placeholder="Search Skin Name"
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                    />
                    
                    {/* Display filtered results in a dropdown with images */}
                    {filteredSkins.length > 0 && (
                      <ul className="skin-dropdown">
                        {filteredSkins.slice(0, 15).map((skin, idx) => ( // Limit to 5 results for simplicity
                          <li key={idx} onClick={() => handleSkinSelect(skin)}>
                            {skin.skin_name}
                            <img src={skin.image_url} className="skin-image-small" />
                            </li>
                        ))}
                      </ul>
                    )}
                </>
            )}

            {/* Float Value Input */}
            <input
                type="number"
                step="0.01"
                placeholder="Float Value"
                value={floatValue}
                onChange={handleFloatChange}
                min={minFloat}
                max={maxFloat}
            />

            {/* Count Input */}
            <input
                type="number"
                placeholder="Count"
                value={count || 1}
                onChange={handleCountChange}
                min={minCount}
                max={maxCount}
            />

            <button className='add-input-entry' onClick={addInputEntry}>Add Entry</button>
        </div>
    );
};

export default TradeupInputEntryForm;
