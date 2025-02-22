import React, { useState, useEffect, useCallback } from 'react';
import Box from '@mui/material/Box';
import TextField from '@mui/material/TextField';
import Button from '@mui/material/Button';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemText from '@mui/material/ListItemText';
import ListItemButton from '@mui/material/ListItemButton';
import CircularProgress from '@mui/material/CircularProgress';
import Typography from '@mui/material/Typography';
import { useApi } from '../../contexts/ApiProvider';
import { Autocomplete } from '@mui/material';

const TradeupInputEntryFormNew = ({ addEntry, isStattrak, selectedRarity }) => {
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

  // vars for skin search bar
  const [loading, setLoading] = useState(false);
  const [open, setOpen] = useState(false);

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

  const handleSkinChange = (skin) => {
    setSelectedSkin(skin);
    setFilteredSkins([]);
    setSearchQuery('');
    if (skin) {
      setMinFloat(skin.min_float);
      setMaxFloat(skin.max_float);
    } else {
      setMinFloat(0);
      setMaxFloat(1);
    }
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
    const successfullyAdded = addEntry(selectedSkin, floatValue, count);
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
            <>
              <Autocomplete
                value={selectedSkin}
                onChange={(event, newValue) => {
                  handleSkinChange(newValue);
                }}
                inputValue={searchQuery}
                onInputChange={(event, newInputValue) => {
                  setSearchQuery(newInputValue);
                }}
                isOptionEqualToValue={(option, value) => option.skin_name === value.skin_name}
                options={filteredSkins}
                getOptionLabel={(option) => option.skin_name}
                renderInput={(params) => (
                  <TextField
                    {...params}
                    label={selectedSkin ? "Selected Skin" : "Teste"}
                    slotProps={{
                      input: {
                        ...params.InputProps,
                        readOnly: Boolean(selectedSkin), // Makes the input read-only if a skin is selected
                        startAdornment: selectedSkin ? (
                          <Box sx={{ display: 'flex', alignItems: 'center', gap: 1 }}>
                            <Box
                              component="img"
                              src={selectedSkin.image_url}
                              alt={selectedSkin.skin_name}
                              sx={{ width: '30px', height: '30px', mr: 1 }}
                            />
                            
                          </Box>
                        ) : null,
                        endAdornment: selectedSkin ? (
                          <>
                            <Box sx={{ display: 'flex', gap: 0.5, mr: 10 }}>
                                <Typography sx={{ fontSize: '0.8em', color: '#ffffff' }}>$100</Typography>
                                <Typography sx={{ fontSize: '0.8em', color: '#ffffff' }}>$90</Typography>
                                <Typography sx={{ fontSize: '0.8em', color: '#ffffff' }}>$80</Typography>
                                <Typography sx={{ fontSize: '0.8em', color: '#ffffff' }}>$70</Typography>
                                <Typography sx={{ fontSize: '0.8em', color: '#ffffff' }}>$60</Typography>
                            </Box>
                            {params.InputProps.endAdornment}
                          </>
                        ) : params.InputProps.endAdornment,
                      }
                    }}
                  />
                )}
                renderOption={(props, option) => {
                  const { key, ...optionProps } = props;
                  return (
                    <Box 
                      key={key}
                      component="li" 
                      sx={{ display: 'flex', alignItems: 'center', gap: 1 }} 
                      {...optionProps}
                    >
                      <Box sx={{ display: 'flex', alignItems: 'center', gap: 1 }}>
                        <Box
                          component="img"
                          src={option.image_url}
                          alt={option.skin_name}
                          sx={{ width: '30px', height: '30px', mr: 1 }}
                        />
                        <Typography sx={{ color: '#ffffff' }}>
                          {option.skin_name}
                        </Typography>
                      </Box>
                      <Box sx={{ display: 'flex', gap: 0.5 }}>
                        <Typography sx={{ fontSize: '0.8em', color: '#ffffff' }}>$100</Typography>
                        <Typography sx={{ fontSize: '0.8em', color: '#ffffff' }}>$90</Typography>
                        <Typography sx={{ fontSize: '0.8em', color: '#ffffff' }}>$80</Typography>
                        <Typography sx={{ fontSize: '0.8em', color: '#ffffff' }}>$70</Typography>
                        <Typography sx={{ fontSize: '0.8em', color: '#ffffff' }}>$60</Typography>
                      </Box>
                    </Box>
                  );
                }}
                sx={{ width: '100%' }}
              
              />
            </>
        
            <Box sx={{ display: 'flex', justifyContent: 'center' }}>
                <Button variant="contained" color="primary" onClick={addInputEntry}>
                Add Entry
                </Button>
            </Box>

            {/* Horizontal line separator */}
            <Box sx={{ borderBottom: '1px solid rgb(0, 0, 0)', width: '100%' }} />
        </Box>
  );
};

export default TradeupInputEntryFormNew;
