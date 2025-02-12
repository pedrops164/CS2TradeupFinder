// TradeupsPurchasable.js
import React from 'react';
import { Box, Typography, Pagination } from '@mui/material';
import usePagination from '../hooks/usePagination';
import TradeupCensored from '../components/TradeupCensored';

const TradeupsPurchasable = () => {
  const {
    data: purchasableTradeups,
    currentPage,
    totalPages,
    handlePageChange,
    isLoading,
    error,
  } = usePagination('/tradeups/purchasable');

  if (isLoading) {
    return (
      <Box sx={{ p: 2, backgroundColor: 'background.default', minHeight: '100vh' }}>
        <Typography variant="h6" color="text.secondary">
          Loading...
        </Typography>
      </Box>
    );
  }

  if (error) {
    return (
      <Box sx={{ p: 2, backgroundColor: 'background.default', minHeight: '100vh' }}>
        <Typography variant="h6" color="error">
          {error}
        </Typography>
      </Box>
    );
  }

  return (
    <Box sx={{ p: 2, backgroundColor: 'background.default', minHeight: '100vh' }}>
      <Typography variant="h4" sx={{ mb: 3, color: 'text.primary' }}>
        Purchasable Tradeups
      </Typography>
      <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mb: 3 }}>
        {purchasableTradeups.map((tradeup) => (
          <TradeupCensored key={tradeup.tradeup_id} tradeup={tradeup} />
        ))}
      </Box>
      <Pagination
        count={totalPages}
        page={currentPage}
        onChange={(event, value) => handlePageChange(value)}
        sx={{ display: 'flex', justifyContent: 'center' }}
      />
    </Box>
  );
};

export default TradeupsPurchasable;
