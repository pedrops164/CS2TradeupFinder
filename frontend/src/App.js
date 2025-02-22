import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import Logger from './utils/Logger';

// mui imports
import { ThemeProvider, createTheme } from '@mui/material/styles';
import CssBaseline from "@mui/material/CssBaseline";

// components, contexts imports
import NavigationBar from './components/NavigationBar';
import ApiProvider from './contexts/ApiProvider';
import UserProvider from './contexts/UserProvider';

// pages imports
import Home from './pages/Home';
import TradeupCalculator from './pages/calculator/TradeupCalculator';
import Tradeups from './pages/Tradeups';
import PublicRoute from './components/PublicRoute';
import PrivateRoute from './components/PrivateRoute';
import SteamCallbackPage from './pages/SteamCallbackPage';

Logger.initialize({
  minLevel: process.env.NODE_ENV === 'production' ? 'INFO' : 'DEBUG',
  app: 'tradeup-finder',
  version: '1.0.0'
});
// Test each log level
Logger.debug('Debug message test', { type: 'test' });
Logger.info('Info message test', { type: 'test' });
Logger.warn('Warning message test', { type: 'test' });
Logger.error('Error message test', { type: 'test' });

const theme = createTheme({
    palette: {
	  	mode: 'dark',
	  	primary: {
            main: '#000000',  // Primary color for the app
        },
        secondary: {
            main: '#262626',  // Secondary color for the app
        },
        text: {
            primary: '#ffffff',
            secondary: '#979797',
        },
    },
});

/* const FullScreenLoader = () => (
  <Box
    sx={{
      backgroundColor: 'background.default',
      minHeight: '100vh',
      display: 'flex',
      justifyContent: 'center',
      alignItems: 'center',
    }}
  >
    <CircularProgress color="inherit" />
  </Box>
); */

const App = () => {

	return (
			<ThemeProvider theme={theme}>
        <CssBaseline />
				<ApiProvider>
					<UserProvider>
						<NavigationBar />
						<Routes>
							<Route path="/" element={<Home />} />
							{/* <Route path="/oauth2/:provider" element={<PublicRoute><SocialLoginPage /></PublicRoute>} />
							<Route path="/oauth2/:provider/callback" element={<PublicRoute><SocialCallbackPage /></PublicRoute>} /> */}
							<Route path="/steam/login" element={<PublicRoute><SteamCallbackPage /></PublicRoute>} />
							<Route path="/calculator" element={<PrivateRoute><TradeupCalculator /></PrivateRoute>} />
							<Route path="/tradeups" element={<Tradeups />} />
							<Route path="/tradeups/:option" element={<Tradeups />} />
						</Routes>
					</UserProvider>
				</ApiProvider>
			</ThemeProvider>
	);
};

export default App;