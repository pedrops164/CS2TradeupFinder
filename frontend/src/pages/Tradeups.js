// Tradeups.js
import React from 'react';
import { NavLink, Outlet, useLocation } from 'react-router-dom';
import { Box, Typography, Paper } from '@mui/material';
import { useApi } from '../contexts/ApiProvider';

const Tradeups = () => {
  const location = useLocation();
  const isSubpageSelected = location.pathname !== '/tradeups';
  const api = useApi();
  const isAuthenticated = api.isAuthenticated();

  return (
    <Box sx={{ p: 2, backgroundColor: 'background.default', minHeight: '100vh' }}>
      {/* Page Title */}
      <Typography variant="h3" sx={{ mb: 3, color: 'text.primary' }}>
        Tradeups
      </Typography>

      {/* Navigation Section */}
      <Box sx={{ display: 'flex', gap: 2, mb: 3, flexWrap: 'wrap' }}>
        <Paper
          component={NavLink}
          to="/tradeups/public"
          sx={{
            p: 2,
            flex: 1,
            textDecoration: 'none',
            '&:hover': { boxShadow: 3 },
          }}
        >
          <Typography variant="h6" color="text.primary">
            Public
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Show all publicly available tradeups, free of charge
          </Typography>
        </Paper>

        <Paper
          component={NavLink}
          to="/tradeups/purchasable"
          onClick={(e) => !isAuthenticated && e.preventDefault()}
          sx={{
            p: 2,
            flex: 1,
            textDecoration: 'none',
            ...( !isAuthenticated && {
              opacity: 0.5,
              pointerEvents: 'none',
            }),
            '&:hover': { boxShadow: 3 },
          }}
        >
          <Typography variant="h6" color="text.primary">
            Purchasable
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Browse tradeups available for purchase
          </Typography>
        </Paper>

        <Paper
          component={NavLink}
          to="/tradeups/purchased"
          onClick={(e) => !isAuthenticated && e.preventDefault()}
          sx={{
            p: 2,
            flex: 1,
            textDecoration: 'none',
            ...( !isAuthenticated && {
              opacity: 0.5,
              pointerEvents: 'none',
            }),
            '&:hover': { boxShadow: 3 },
          }}
        >
          <Typography variant="h6" color="text.primary">
            Purchased
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Browse purchased tradeups
          </Typography>
        </Paper>

        <Paper
          component={NavLink}
          to="/tradeups/tracked"
          onClick={(e) => !isAuthenticated && e.preventDefault()}
          sx={{
            p: 2,
            flex: 1,
            textDecoration: 'none',
            ...( !isAuthenticated && {
              opacity: 0.5,
              pointerEvents: 'none',
            }),
            '&:hover': { boxShadow: 3 },
          }}
        >
          <Typography variant="h6" color="text.primary">
            Tracked
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Access your tracked and private tradeups
          </Typography>
        </Paper>
      </Box>

      {/* Subpage Content */}
      {isSubpageSelected && (
        <Box sx={{ p: 2, backgroundColor: 'background.paper', borderRadius: 1 }}>
          <Outlet />
        </Box>
      )}
    </Box>
  );
};

export default Tradeups;
