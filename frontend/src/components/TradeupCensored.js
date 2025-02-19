import React from 'react';
import { Box, Typography, Paper } from '@mui/material';

const TradeupCensored = ({ tradeup }) => {
  return (
    <Paper elevation={3} sx={{ p: 2, mb: 2 }}>
      <Box>
        <Typography variant="h6" sx={{ fontWeight: 'bold', mb: 1 }}>
          {tradeup.name}
        </Typography>
        <Typography variant="body2" sx={{ mb: 0.5 }}>
          Input Rarity: {tradeup.input_rarity}
        </Typography>
        <Typography variant="body2" sx={{ mb: 0.5 }}>
          Input Cost: {tradeup.input_skins_cost.toFixed(2)}€
        </Typography>
        <Typography variant="body2" sx={{ mb: 0.5 }}>
          Profit Average: {tradeup.avg_profitability.toFixed(2)}%
        </Typography>
        <Typography variant="body2" sx={{ mb: 0.5 }}>
          Profit Odds: {tradeup.profit_odds.toFixed(2)}%
        </Typography>
        <Typography variant="body2">
          StatTrak: {tradeup.stattrak ? 'Yes' : 'No'}
        </Typography>
      </Box>
    </Paper>
  );
};

export default TradeupCensored;
