import React from 'react';
import { AppBar, Toolbar, Typography, Button, Box } from '@mui/material';
import { NavLink, useNavigate  } from 'react-router-dom';

const NavigationBar = ({ isAuthenticated, setIsAuthenticated }) => {
  const navigate = useNavigate();

  const handleLogout = async () => {
    try {
      const response = await fetch('/api/logout', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' }
      });
      if (response.ok) {
        setIsAuthenticated(false);
        //alert('Logout successful');
        navigate('/login');
      } else {
        alert('Logout failed');
      }
    } catch (error) {
      //console.error('Logout error:', error);
      alert('Logout failed');
    }
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
          {isAuthenticated ? (
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