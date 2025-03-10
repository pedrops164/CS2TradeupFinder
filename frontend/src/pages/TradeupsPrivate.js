// TradeupsPrivate.js
import React, {useMemo, useState, useEffect} from 'react';
import { Box, Typography, Pagination } from '@mui/material';
import usePagination from '../hooks/usePagination';
import TrackedTradeup from '../components/TrackedTradeup';
import { useApi } from '../contexts/ApiProvider';

const TradeupsPrivate = ({apiUrl, sortBy}) => {
  // Memoize the query so its reference only changes when sortBy changes
  const api = useApi();
  const query = useMemo(() => ({ sort_by: sortBy }), [sortBy]);

  const { data, error, currentPage, totalPages, handlePageChange } = usePagination({ apiUrl, query });

  // Keep a local array of tradeups in state, so we can modify it
  const [tradeups, setTradeups] = useState([]);

  // Whenever "data" changes, update local state
  useEffect(() => {
    if (data?.tradeups) {
      setTradeups(data.tradeups);
    }
  }, [data]);
  
  const onTradeupUntrack = async (tradeup_id) => {
    console.log('Untrack button clicked!');
    setTradeups((prevTradeups) => prevTradeups.filter((t) => t.id !== tradeup_id));
    // call route to untrack tradeup
    const response = await api.get(`/tradeups/${tradeup_id}/untrack`);
    if (response.ok) {
      console.log('Tradeup untracked successfully');
    } else {
      console.error('Failed to untrack tradeup:', response.body.error);
    }
  };

  return (data === undefined ? (
      <Box sx={{ p: 2, backgroundColor: 'background.default', minHeight: '100vh' }}>
        <Typography variant="h6" color="text.secondary">
          Loading...
        </Typography>
      </Box>
    ) : data === null ? (
      <Box sx={{ p: 2, backgroundColor: 'background.default', minHeight: '100vh' }}>
        <Typography variant="h6" color="error">
          Error: {error}
        </Typography>
      </Box>
    ) : (
    <Box sx={{ p: 2, backgroundColor: 'background.default', minHeight: '100vh' }}>
      <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mb: 3 }}>
        {tradeups.map((tradeup) => (
          <TrackedTradeup key={tradeup.id} tradeup={tradeup} onTradeupUntrack={onTradeupUntrack} />
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
  ));
};

export default TradeupsPrivate;
