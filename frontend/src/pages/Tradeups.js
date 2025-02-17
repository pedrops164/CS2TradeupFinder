// Tradeups.js
import React, { useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Box, Typography, Card, CardActionArea, CardContent, FormControl, InputLabel, Select, MenuItem } from '@mui/material';
import { useApi } from '../contexts/ApiProvider';
import TradeupsPublic from './TradeupsPublic';
import TradeupsPurchasable from './TradeupsPurchasable';
import TradeupsPurchased from './TradeupsPurchased';
import TradeupsPrivate from './TradeupsPrivate';

const Tradeups = () => {
  const api = useApi();
  const { option } = useParams();
  const navigate = useNavigate();
  const isAuthenticated = api.isAuthenticated();
  const [selectedOption, setSelectedOption] = React.useState(option);
  // Local state for sort selection, defaulting to "Highest return"
  const [sortBy, setSortBy] = useState('avg_profitability');

  const handleCardClick = (option) => {
    // For restricted options, do nothing if not authenticated
    if (
      (option === 'purchasable' || option === 'purchased' || option === 'tracked') &&
      !isAuthenticated
    ) {
      return;
    }
    setSelectedOption(option);
    navigate(`/tradeups/${option}`);
  };

  const handleSortChange = (event) => {
    setSortBy(event.target.value);
  };

  return (
    <Box sx={{ p: 2, backgroundColor: 'background.default', minHeight: '100vh' }}>
      {/* Page Title and sort by selector */}
      <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', mb: 2 }}>
        <Typography variant="h4" sx={{ color: 'text.primary' }}>
          Public Tradeups
        </Typography>
        <FormControl sx={{ minWidth: 150, mr: 2 }}>
          <InputLabel id="sort-select-label">Sort By</InputLabel>
          <Select
            labelId="sort-select-label"
            id="sort-select"
            value={sortBy}
            label="Sort By"
            onChange={handleSortChange}
          >
            <MenuItem value="created_at">Most recent</MenuItem>
            <MenuItem value="avg_profitability">Highest return</MenuItem>
          </Select>
        </FormControl>
      </Box>

      {/* Navigation Section */}
      <Box sx={{ display: 'flex', gap: 2, mb: 3, flexWrap: 'wrap' }}>
        {/* Public Tradeups Card */}
        <Card
          sx={{
            flex: 1,
            cursor: 'pointer',
            border: selectedOption === 'public' ? '2px solid' : 'none',
            borderColor: selectedOption === 'public' ? 'primary.main' : 'transparent',
          }}
          onClick={() => handleCardClick('public')}
        >
          <CardActionArea>
            <CardContent>
              <Typography variant="h6" color="text.primary">
                Public
              </Typography>
              <Typography variant="body2" color="text.secondary">
                Show all publicly available tradeups, free of charge
              </Typography>
            </CardContent>
          </CardActionArea>
        </Card>

        {/* Purchasable Tradeups Card */}
        <Card
          sx={{
            flex: 1,
            cursor: isAuthenticated ? 'pointer' : 'not-allowed',
            opacity: isAuthenticated ? 1 : 0.5,
            border: selectedOption === 'purchasable' ? '2px solid' : 'none',
            borderColor: selectedOption === 'purchasable' ? 'primary.main' : 'transparent',
          }}
          onClick={() => handleCardClick('purchasable')}
        >
          <CardActionArea>
            <CardContent>
              <Typography variant="h6" color="text.primary">
                Purchasable
              </Typography>
              <Typography variant="body2" color="text.secondary">
                Browse tradeups available for purchase
              </Typography>
            </CardContent>
          </CardActionArea>
        </Card>

        {/* Purchased Tradeups Card */}
        <Card
          sx={{
            flex: 1,
            cursor: isAuthenticated ? 'pointer' : 'not-allowed',
            opacity: isAuthenticated ? 1 : 0.5,
            border: selectedOption === 'purchased' ? '2px solid' : 'none',
            borderColor: selectedOption === 'purchased' ? 'primary.main' : 'transparent',
          }}
          onClick={() => handleCardClick('purchased')}
        >
          <CardActionArea>
            <CardContent>
              <Typography variant="h6" color="text.primary">
                Purchased
              </Typography>
              <Typography variant="body2" color="text.secondary">
                Browse purchased tradeups
              </Typography>
            </CardContent>
          </CardActionArea>
        </Card>

        {/* Tracked Tradeups Card */}
        <Card
          sx={{
            flex: 1,
            cursor: isAuthenticated ? 'pointer' : 'not-allowed',
            opacity: isAuthenticated ? 1 : 0.5,
            border: selectedOption === 'tracked' ? '2px solid' : 'none',
            borderColor: selectedOption === 'tracked' ? 'primary.main' : 'transparent',
          }}
          onClick={() => handleCardClick('tracked')}
        >
          <CardActionArea>
            <CardContent>
              <Typography variant="h6" color="text.primary">
                Tracked
              </Typography>
              <Typography variant="body2" color="text.secondary">
                Access your tracked and private tradeups
              </Typography>
            </CardContent>
          </CardActionArea>
        </Card>
      </Box>

      {/* Subpage Content */}
      <Box sx={{ p: 2, backgroundColor: 'background.paper', borderRadius: 1 }}>
        {selectedOption === 'public' && <TradeupsPublic apiUrl="/tradeups/public" sortBy={sortBy} />}
        {selectedOption === 'purchasable' && <TradeupsPurchasable apiUrl="/tradeups/purchasable" sortBy={sortBy} />}
        {selectedOption === 'purchased' && <TradeupsPurchased apiUrl="/tradeups/purchased" sortBy={sortBy} />}
        {selectedOption === 'tracked' && <TradeupsPrivate apiUrl="/tradeups/tracked" sortBy={sortBy}/>}
      </Box>
    </Box>
  );
};

export default Tradeups;
