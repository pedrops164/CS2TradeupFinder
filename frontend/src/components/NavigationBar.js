import React, { useEffect, useState } from 'react';
import { AppBar, Toolbar, Typography, Button, Box } from '@mui/material';
import { NavLink, useNavigate  } from 'react-router-dom';
import { useUser } from '../contexts/UserProvider';

const NavigationBar = () => {
  const navigate = useNavigate();
  const { user, logout } = useUser();

  const handleLogout = async () => {
    await logout();
    navigate('/login');
  };

  return (
    <>
      {/* The AppBar is fixed at the top */}
      <AppBar position="fixed" sx={{ backgroundColor: '#000000' }}>
        <Toolbar>
          {/* Optional: App name or logo */}
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            TradeupFinder
          </Typography>
          {/* Navigation buttons */}
          <Button
            color="inherit"
            component={NavLink}
            to="/"
            sx={{
              '&.active': { fontWeight: 'bold', textDecoration: 'underline' },
            }}
          >
            Home
          </Button>
          <Button
            color="inherit"
            component={NavLink}
            to="/tradeups"
            sx={{
              '&.active': { fontWeight: 'bold', textDecoration: 'underline' },
            }}
          >
            Tradeups
          </Button>
          <Button
            color="inherit"
            component={NavLink}
            to="/calculator"
            sx={{
              '&.active': { fontWeight: 'bold', textDecoration: 'underline' },
            }}
          >
            Calculator
          </Button>
          {/* Conditionally render Login/Logout button */}
          {user ? (
            <Button color="inherit" onClick={handleLogout}>
              Logout
            </Button>
          ) : (
            <Button
              color="inherit"
              component={NavLink}
              to="/login"
              sx={{
                '&.active': { fontWeight: 'bold', textDecoration: 'underline' },
              }}
            >
              Login
            </Button>
          )}
        </Toolbar>
      </AppBar>
      {/* Adding a spacer so that the page content doesn't get hidden under the fixed AppBar */}
      <Box sx={{ height: (theme) => theme.spacing(8) }} />
    </>
  );
};

export default NavigationBar;