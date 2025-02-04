import { lazy, Suspense, useState, useEffect } from 'react';
import { Routes, Route } from 'react-router-dom';
import NavBar from './components/NavBar';
import ProtectedRoute from './components/ProtectedRoute';
import Logger from './utils/Logger';

const Home = lazy(() => import('./pages/Home'));
const Login = lazy(() => import('./pages/Login'));
const TradeupCalculator = lazy(() => import('./pages/calculator/TradeupCalculator'));
const Tradeups = lazy(() => import('./pages/Tradeups'));
const TradeupsPublic  = lazy(() => import('./pages/TradeupsPublic'));
const TradeupsPurchasable = lazy(() => import('./pages/TradeupsPurchasable'));
const TradeupsPurchased = lazy(() => import('./pages/TradeupsPurchased'));
const TradeupsPrivate = lazy(() => import('./pages/TradeupsPrivate'));

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

const App = () => {
	const [isAuthenticated, setIsAuthenticated] = useState(false);
	const [isLoading, setIsLoading] = useState(true);
	const [userRole, setUserRole] = useState(null);
  
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
	};

	if (isLoading) {
	  return <div>Loading...</div>; // Or a loading spinner component
	}
  
	return (
		<>
			<NavBar isAuthenticated={isAuthenticated} setIsAuthenticated={setIsAuthenticated} />
			<Suspense fallback={<div className="container">Loading...</div>}>
				<Routes>
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
				</Routes>
			</Suspense>
		</>
	);
};

export default App;