// TradeupsPurchased.js
import React from 'react';
import { Box, Typography, Pagination } from '@mui/material';
import usePagination from '../hooks/usePagination';
import Tradeup from '../components/Tradeup';

const TradeupsPurchased = () => {
  const {
    data: purchasedTradeups,
    currentPage,
    totalPages,
    handlePageChange,
    isLoading,
    error,
  } = usePagination('/api/tradeups/purchased');

  if (isLoading) {
    return (
      <Box sx={{ p: 2 }}>
        <Typography variant="h6" color="text.secondary">
          Loading...
        </Typography>
      </Box>
    );
  }

  if (error) {
    return (
      <Box sx={{ p: 2 }}>
        <Typography variant="h6" color="error">
          {error}
        </Typography>
      </Box>
    );
  }

  return (
    <Box sx={{ p: 2, backgroundColor: 'background.default', minHeight: '100vh' }}>
      <Typography variant="h4" sx={{ mb: 3, color: 'text.primary' }}>
        Purchased Tradeups
      </Typography>
      <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mb: 3 }}>
        {purchasedTradeups.map((tradeup) => (
          <Tradeup key={tradeup.tradeup_id} tradeup={tradeup} />
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

export default TradeupsPurchased;
