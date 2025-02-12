import React from 'react';
import { Box, Typography, Pagination } from '@mui/material';
import usePagination from '../hooks/usePagination';
import Tradeup from '../components/Tradeup';

const TradeupsPublic = () => {
  const { data: publicTradeups, currentPage, totalPages, handlePageChange, isLoading, error } =
    usePagination('/tradeups/public');

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
        Public Tradeups
      </Typography>
      {/* Each tradeup appears on its own line */}
      <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mb: 3 }}>
        {publicTradeups.map((tradeup) => (
          <Tradeup key={tradeup.tradeup_id} tradeup={tradeup} />
        ))}
      </Box>
      {/* MUI Pagination Component */}
      <Pagination
        count={totalPages}
        page={currentPage}
        onChange={(event, value) => handlePageChange(value)}
        sx={{ display: 'flex', justifyContent: 'center' }}
      />
    </Box>
  );
};

export default TradeupsPublic;
