import React, { useState, useEffect } from 'react';
import { Routes, Route } from 'react-router-dom';
import Logger from './utils/Logger';

// mui imports
import { ThemeProvider, createTheme } from '@mui/material/styles';
import { Box, CircularProgress } from '@mui/material';

// components, contexts imports
import ProtectedRoute from './components/ProtectedRoute';
import NavigationBar from './components/NavigationBar';
import ApiProvider from './contexts/ApiProvider';
import UserProvider from './contexts/UserProvider';

// pages imports
import Home from './pages/Home';
import Login from './pages/Login';
import TradeupCalculator from './pages/calculator/TradeupCalculator';
import Tradeups from './pages/Tradeups';
import TradeupsPublic from './pages/TradeupsPublic';
import TradeupsPurchasable from './pages/TradeupsPurchasable';
import TradeupsPurchased from './pages/TradeupsPurchased';
import TradeupsPrivate from './pages/TradeupsPrivate';
import PublicRoute from './components/PublicRoute';
import PrivateRoute from './components/PrivateRoute';

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
	/* const [isAuthenticated, setIsAuthenticated] = useState(false);
	const [isLoading, setIsLoading] = useState(true);
  
	useEffect(() => {
	  // Check authentication status when the app loads
	  checkAuthStatus();
	}, []);

	const checkAuthStatus = async () => {
		setIsLoading(true);
		try {
			await fetch('/api/check-auth', {
			method: 'GET',
			credentials: 'include', // Important for sending cookies
			})
			.then(response => {
				if(!response.ok) throw new Error(response.status);
				else return response.json();
			})
			.then(jsonData => {
				Logger.info('Authenticated: ' + jsonData.authenticated);
				Logger.info('role: ' + jsonData.user_role);
				setUserRole(jsonData.user_role);
				setIsAuthenticated(jsonData.authenticated);
			})
			.catch((error) => {
				alert('error: ' + error);
			});
		} catch (error) {
			Logger.error('Error checking authentication status:', error);
			setIsAuthenticated(false);
		} finally {
			setIsLoading(false);
		}
	}; */

	return (
			<ThemeProvider theme={theme}>
				<ApiProvider>
					<UserProvider>
						<NavigationBar />
						{/* <Routes>
							<Route path="/" element={<Home />} />
							<Route path="/login" element={<Login setIsAuthenticated={setIsAuthenticated} />} />

							<Route element={<ProtectedRoute isAuthenticated={isAuthenticated} />}>
								<Route path="calculator" element={<TradeupCalculator user_role={userRole}/>} />
							</Route>

							<Route path="/tradeups" element={<Tradeups isAuthenticated={isAuthenticated} />}>
								<Route path="public" element={<TradeupsPublic />} />
								<Route element={<ProtectedRoute isAuthenticated={isAuthenticated} />}>
									<Route path="purchasable" element={<TradeupsPurchasable />} />
									<Route path="purchased" element={<TradeupsPurchased />} />
									<Route path="tracked" element={<TradeupsPrivate />} />
								</Route>
							</Route>
						</Routes> */}
						<Routes>
							<Route path="/" element={<Home />} />
							<Route path="/login" element={<PublicRoute><Login /></PublicRoute>} />

							<Route path="/calculator" element={<PrivateRoute><TradeupCalculator /></PrivateRoute>} />

							<Route path="/tradeups" element={<Tradeups />}>
								<Route path="public" element={<TradeupsPublic />} />
								<Route path="*" element={
									<PrivateRoute>
										<Routes>
											<Route path="purchasable" element={<TradeupsPurchasable />} />
											<Route path="purchased" element={<TradeupsPurchased />} />
											<Route path="tracked" element={<TradeupsPrivate />} />
										</Routes>
									</PrivateRoute>
								}/>
								{/* <Route path="purchasable" element={<TradeupsPurchasable />} />
								<Route path="purchased" element={<TradeupsPurchased />} />
								<Route path="tracked" element={<TradeupsPrivate />} /> */}
							</Route>
						</Routes>
					</UserProvider>
				</ApiProvider>
			</ThemeProvider>
	);
};

export default App;