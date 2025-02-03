import React, {useState, useEffect, useCallback} from 'react';
import '../../styles/TradeupCalculator.css';

const TradeupInputEntryForm = ({ addEntry, isStattrak, selectedRarity }) => {
    const [searchQuery, setSearchQuery] = useState('');
    const [filteredSkins, setFilteredSkins] = useState([]);
    const [selectedSkin, setSelectedSkin] = useState(null);
    const [minFloat, setMinFloat] = useState(0); // Default min float
    const [maxFloat, setMaxFloat] = useState(1); // Default max float
    const minCount = 1;
    const maxCount = 10;

    const [floatValue, setFloatValue] = useState(minFloat);
    const [count, setCountValue] = useState(minCount);

    // vars to handle scrolling down on the searched skins dropdown
    const [currentPage, setCurrentPage] = useState(1);
    const [totalPages, setTotalPages] = useState(1);
    const [isLoadingSkins, setIsLoadingSkins] = useState(false);

    // Fetch filtered skins from the backend
    const fetchFilteredSkins = useCallback(async (page) => {
        try {
            const response = await fetch(
                `/api/skins/search?search_string=${searchQuery}&rarity=${selectedRarity}&stattrak=${isStattrak}&page=${page}`
            );
            const data = await response.json();
            
            if (page === 1) {
                setFilteredSkins(data.skins); // Reset the list for the first page
            } else {
                setFilteredSkins((prevSkins) => [...prevSkins, ...data.skins]); // Append new skins
            }
            setTotalPages(data.total_pages);
        } catch (error) {
            console.error('Error fetching filtered skins:', error);
        } finally {
            setIsLoadingSkins(false);
        }
    }, [searchQuery, isStattrak, selectedRarity]);

    // Activated whenever searchQuery, selectedRarity, or isStattrak changes
    useEffect(() => {
        setCurrentPage(1); // Reset page to 1 whenever search query or isStattrak or selectedRarity changes

        // Only fetch if there's a search query
        if (searchQuery !== '') {
            fetchFilteredSkins(1); //fetch first page
        } else {
            setFilteredSkins([]); // Clear filtered skins if no filters are applied
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

    const listenSkinsScrollEvent = (e) => {
        const bottom = e.target.scrollHeight - e.target.scrollTop === e.target.clientHeight;
        if (bottom && !isLoadingSkins && currentPage < totalPages) {
            // user scrolled to the bottom
            console.log('Reached the bottom!');
            setIsLoadingSkins(true);
            fetchFilteredSkins(currentPage + 1);
            console.log('fetching page:', currentPage + 1);
            console.log('total pages:', totalPages);
            setCurrentPage((prevPage) => prevPage + 1);
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
                      <ul className="skin-dropdown" onScroll={listenSkinsScrollEvent}>
                        {filteredSkins.map((skin, idx) => (
                          <li key={idx} onClick={() => handleSkinSelect(skin)}>
                            {skin.skin_name}
                            <img src={skin.image_url} className="skin-image-small" />
                            </li>
                        ))}
                      </ul>
                    )}

                    {/* Show loading spinner when fetching more skins */}
                    {isLoadingSkins && <div className="loading-spinner">Loading...</div>}
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
