import React, { useEffect, useState } from 'react';
import { AppBar, Toolbar, Typography, Button, Box } from '@mui/material';
import { NavLink, useNavigate  } from 'react-router-dom';
import { useUser } from '../contexts/UserProvider';
import login_with_steam_img_url from '../assets/login_with_steam.png';
import { useApi } from '../contexts/ApiProvider';
import DisabledWrapper from './DisabledWrapper';

const NavigationBar = () => {
  const navigate = useNavigate();
  const { user, logout } = useUser();
  const api = useApi();

  const handleLogout = async () => {
    await logout();
    navigate('/');
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
          <DisabledWrapper disabled={!user} tooltipText="Login to use the calculator">
            <Button
              color="inherit"
              component={NavLink}
              to="/calculator"
              disabled={!user}
              sx={{
                '&.active': { fontWeight: 'bold', textDecoration: 'underline' },
              }}
            >
              Calculator
            </Button>
          </DisabledWrapper>
          {/* Conditionally render Login/Logout button */}
          {user === undefined ? null : user ? (
            <Button color="inherit" onClick={handleLogout}>
              Logout
            </Button>
          ) : (
            <Button
              color="inherit"
              sx={{
                '&.active': { fontWeight: 'bold', textDecoration: 'underline' },
              }}
              onClick={() => window.location.href = api.base_url + '/tokens/steam'}
              startIcon={<img src={login_with_steam_img_url} alt="Login with Steam" />}
            >
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