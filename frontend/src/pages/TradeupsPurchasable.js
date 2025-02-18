// TradeupsPurchasable.js
import React, {useMemo} from 'react';
import { Box, Typography, Pagination } from '@mui/material';
import usePagination from '../hooks/usePagination';
import TradeupCensored from '../components/TradeupCensored';

const TradeupsPurchasable = ({apiUrl, sortBy}) => {
  // Memoize the query so its reference only changes when sortBy changes
  const query = useMemo(() => ({ sort_by: sortBy }), [sortBy]);

  const { data, currentPage, totalPages, handlePageChange } = usePagination({ apiUrl, query });

  return (data === undefined ? (
        <Box sx={{ p: 2, backgroundColor: 'background.default', minHeight: '100vh' }}>
          <Typography variant="h6" color="text.secondary">
            Loading...
          </Typography>
        </Box>
      ) : data === null ? (
        <Box sx={{ p: 2, backgroundColor: 'background.default', minHeight: '100vh' }}>
          <Typography variant="h6" color="error">
            Error fetching data
          </Typography>
        </Box>
      ) : (
    <Box sx={{ p: 2, backgroundColor: 'background.default', minHeight: '100vh' }}>
      <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mb: 3 }}>
        {data.tradeups.map((tradeup) => (
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
  ));
};

export default TradeupsPurchasable;
