import React, {useMemo, useState, useEffect} from 'react';
import { Box, Typography, Pagination } from '@mui/material';
import usePagination from '../hooks/usePagination';
import PublicTradeup from '../components/PublicTradeup';
import { useApi } from '../contexts/ApiProvider';

const TradeupsPublic = ({apiUrl, sortBy}) => {
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
  
  const onTradeupRemove = async (tradeup_id) => {
    console.log('Remove button clicked!');
    setTradeups((prevTradeups) => prevTradeups.filter((t) => t.id !== tradeup_id));
    // call route to remove tradeup
    const response = await api.get(`/tradeups/${tradeup_id}/remove`);
    if (response.ok) {
      console.log('Tradeup removed successfully');
    } else {
      console.error('Failed to remove tradeup:', response.body.error);
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
      {/* Each tradeup appears on its own line */}
      <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mb: 3 }}>
        {tradeups.map((tradeup) => (
          <PublicTradeup key={tradeup.id} tradeup={tradeup} onTradeupRemove={onTradeupRemove}  />
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

export default TradeupsPublic;
