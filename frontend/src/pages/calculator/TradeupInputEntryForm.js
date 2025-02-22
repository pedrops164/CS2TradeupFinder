import React, { useState, useEffect, useCallback } from 'react';
import { getSkinCondition } from '../../utils/helperFunctions';

import Box from '@mui/material/Box';
import TextField from '@mui/material/TextField';
import Button from '@mui/material/Button';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemText from '@mui/material/ListItemText';
import ListItemButton from '@mui/material/ListItemButton';
import CircularProgress from '@mui/material/CircularProgress';
import Typography from '@mui/material/Typography';
import Chip from '@mui/material/Chip';
import Divider from '@mui/material/Divider';
import { useApi } from '../../contexts/ApiProvider';
import { Tooltip } from '@mui/material';

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

  // Variables to handle pagination when scrolling the skin dropdown
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [isLoadingSkins, setIsLoadingSkins] = useState(false);

  // List of conditions for skins
  const skin_conditions = ['Factory New', 'Minimal Wear', 'Field-Tested', 'Well-Worn', 'Battle-Scarred'];

  // Compute the condition based on the current floatValue
  const skinCondition = getSkinCondition(floatValue);

  // Look up the price for that condition (using the stattrak flag)
  const skinPrice =
    selectedSkin &&
    selectedSkin.conditions &&
    selectedSkin.conditions[skinCondition] &&
    selectedSkin.conditions[skinCondition]['price'];

  const api = useApi();

  // Fetch filtered skins from the backend
  const fetchFilteredSkins = useCallback(async (page) => {
    const response = await api.get(
      `/skins/search?search_string=${searchQuery}&rarity=${selectedRarity}&stattrak=${isStattrak}&page=${page}`
    );
    const data = response.body;
    if (response.ok) {
      if (page === 1) {
        setFilteredSkins(data.skins); // Reset the list for the first page
      } else {
        setFilteredSkins((prevSkins) => [...prevSkins, ...data.skins]); // Append new skins
      }
      setTotalPages(data.total_pages);
    } else {
      console.error('Error fetching filtered skins:', data);
    }
    setIsLoadingSkins(false);
  }, [searchQuery, isStattrak, selectedRarity]);

  // Trigger fetch when searchQuery changes
  useEffect(() => {
    setCurrentPage(1); // Reset page to 1 on query change
    if (searchQuery !== '') {
      fetchFilteredSkins(1);
    } else {
      setFilteredSkins([]);
    }
  }, [searchQuery, fetchFilteredSkins]);

  // Remove the currently selected skin when isStattrak or selectedRarity changes
  useEffect(() => {
    handleRemoveSkin();
  }, [isStattrak, selectedRarity]);

  const handleSkinSelect = (skin) => {
    setSelectedSkin(skin);
    setFilteredSkins([]);
    setSearchQuery('');
    setMinFloat(skin.min_float);
    setMaxFloat(skin.max_float);
    setFloatValue(skin.min_float);
  };

  const handleRemoveSkin = () => {
    setSelectedSkin(null);
    setMinFloat(0); // Reset to default
    setMaxFloat(1); // Reset to default
  };

  // Clamp the float value within the min/max range
  const handleFloatChange = (e) => {
    let value = parseFloat(e.target.value);
    if (value < minFloat) {
      value = minFloat;
    } else if (value > maxFloat) {
      value = maxFloat;
    }
    setFloatValue(value);
  };

  // Ensure count is between minCount and maxCount
  const handleCountChange = (e) => {
    let value = parseInt(e.target.value, 10);
    if (!isNaN(value)) {
      if (value < minCount) {
        value = minCount;
      } else if (value > maxCount) {
        value = maxCount;
      }
    }
    setCountValue(value);
  };

  const addInputEntry = () => {
    const successfullyAdded = addEntry(selectedSkin, floatValue, count, skinCondition, skinPrice);
    if (successfullyAdded) {
      handleRemoveSkin();
      setFloatValue(0);
      setCountValue(1);
    }
  };

  // Handle scroll event to fetch additional skins when at the bottom of the list
  const listenSkinsScrollEvent = (e) => {
    const bottom = e.target.scrollHeight - e.target.scrollTop === e.target.clientHeight;
    if (bottom && !isLoadingSkins && currentPage < totalPages) {
      setIsLoadingSkins(true);
      fetchFilteredSkins(currentPage + 1);
      setCurrentPage((prevPage) => prevPage + 1);
    }
  };

  return (
        <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, bgcolor: 'secondary.main', p: 2, borderRadius: '4px' }}>
            {selectedSkin ? (
            // If a skin is selected, show a flex container with three columns and the add entry button below.
            <>
                {/* Top row: Image | Skin Info | Count and Float */}
                <Box
                    sx={{
                        display: 'flex',
                        flexDirection: 'row',
                        alignItems: 'center',
                        justifyContent: 'space-between',
                    }}
                >
                    {/* Left Column: Skin Image */}
                    <Box sx={{ flex: '0 0 auto' }}>
                        <img
                        src={selectedSkin.image_url}
                        alt={selectedSkin.skin_name}
                        style={{ width: '60px', height: '60px', borderRadius: '4px' }}
                        />
                    </Box>

                    {/* Middle Column: Skin Name and Price */}
                    <Box
                        sx={{
                        flex: '1 1 auto',
                        display: 'flex',
                        flexDirection: 'column',
                        alignItems: 'flex-start',
                        ml: 2, // margin-left for spacing from the image
                        }}
                    >
                        <Typography variant="h6">{selectedSkin.skin_name}</Typography>
                        <Typography variant="body2" color="text.secondary">
                          {skinPrice ? `${skinCondition} | $${skinPrice}` : 'Price N/A'}
                        </Typography>
                    </Box>

                    {/* Right Column: Count (top) and Float Value (bottom) */}
                    <Box
                        sx={{
                        flex: '0 0 auto',
                        display: 'flex',
                        flexDirection: 'column',
                        alignItems: 'flex-end',
                        gap: 1, // vertical spacing between the two fields
                        }}
                    >
                        <TextField
                            label="Count"
                            type="number"
                            size="small"
                            value={count}
                            onChange={handleCountChange}
                            inputProps={{ min: minCount, max: maxCount }}
                            sx={{ width: '100px' }}
                        />
                        <TextField
                            label="Float Value"
                            type="number"
                            size="small"
                            value={floatValue}
                            onChange={handleFloatChange}
                            inputProps={{ step: '0.01', min: minFloat, max: maxFloat }}
                            sx={{ width: '100px' }}
                        />
                    </Box>
                </Box>
            </>
        ) : (
            // If no skin is selected, show the search field and dropdown for skins.
            <>
            <TextField
                label="Search Skin Name"
                variant="outlined"
                size="small"
                color="text.secondary"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                sx={{
                    // Root class for the input field
                    "& .MuiOutlinedInput-root": {
                      fontWeight: "bold",
                      // Class for the border around the input field
                      "& .MuiOutlinedInput-notchedOutline": {
                        borderColor: "#2e2e2e",
                        borderWidth: "2px",
                      },
                    },
                    // Class for the label of the input field
                    "& .MuiInputLabel-outlined": {
                      color: 'text.secondary',
                      fontWeight: "bold",
                    },
                  }}
            />
            {/* Display filtered results in a dropdown */}
            {filteredSkins.length > 0 && (
                <List onScroll={listenSkinsScrollEvent} sx={{maxHeight: '200px', overflow: 'auto'}}>
                {filteredSkins.map((skin, idx) => (
                    <ListItemButton divider key={idx} onClick={() => handleSkinSelect(skin)}>
                        <Box
                            component="img"
                            sx={{
                              width: 30,
                              height: 30,
                              mr: 1,
                              ml: 1,
                            }}
                            alt={skin.skin_name}
                            src={skin.image_url}
                        />
                        <ListItemText primary={skin.skin_name} /> 
                        {/* Show prices for the 5 floats. In dark-grey the unavailable floats, and green the available ones.
                        Box for the outer container, Chips for each float, Divider dividing each chip. */}
                        <List sx={{ display: 'flex', flexDirection: 'row' }}>
                            {skin_conditions.map((condition, idx) => (
                              <React.Fragment key={idx}>
                                <Tooltip title={condition}>
                                  <Chip
                                    label={
                                      skin.conditions[condition]
                                        ? (skin.conditions[condition]['price'] ? skin.conditions[condition]['price'] + "$" : 'N/A')
                                        : '-'
                                    }
                                    color={skin.conditions[condition] ? 'success' : 'default'}
                                    size="small"
                                    sx={{
                                      m: 0, // Remove any default margin
                                      borderRadius: 0, // Reset the border radius so we can control it on first/last
                                      // For the first chip, restore the left border radii.
                                      ...(idx === 0 && {borderTopLeftRadius: 12, borderBottomLeftRadius: 12}),
                                      // For the last chip, restore the right border radii.
                                      ...(idx === skin_conditions.length - 1 && {borderTopRightRadius: 12, borderBottomRightRadius: 12}),
                                    }}
                                  />
                                </Tooltip>
                                {idx !== skin_conditions.length - 1 && (
                                  <Divider orientation="vertical" flexItem />
                                )}
                              </React.Fragment>
                            ))}
                        </List>
                    </ListItemButton>
                ))}
                </List>
            )}
            {/* Show a loading spinner when fetching more skins */}
            {isLoadingSkins && (
                <Box sx={{ display: 'flex', justifyContent: 'center', mt: 1 }}>
                <CircularProgress size={20} />
                </Box>
            )}
            </>
        )}
        
            <Box sx={{ display: 'flex', justifyContent: 'center' }}>
                <Button variant="contained" color="primary" onClick={addInputEntry}>
                Add Entry
                </Button>
                {/* Remove Button */}
                <Button onClick={() => handleRemoveSkin()} sx={{ bgcolor: 'error.main' }}>
                  X
                </Button>
            </Box>

            {/* Horizontal line separator */}
            <Box sx={{ borderBottom: '1px solid rgb(0, 0, 0)', width: '100%' }} />
        </Box>
  );
};

export default TradeupInputEntryForm;
