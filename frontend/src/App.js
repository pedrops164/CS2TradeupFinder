import { lazy, Suspense, useState, useEffect } from 'react';
import { Routes, Route } from 'react-router-dom';
import NavBar from './components/NavBar';
import ProtectedRoute from './components/ProtectedRoute';

const Home = lazy(() => import('./pages/Home'));
const About = lazy(() => import('./pages/About'));
const Login = lazy(() => import('./pages/Login'));
const Tradeups = lazy(() => import('./pages/Tradeups'));
const TradeupsPublic  = lazy(() => import('./pages/TradeupsPublic'));
const TradeupsPurchasable = lazy(() => import('./pages/TradeupsPurchasable'));
const TradeupsPrivate = lazy(() => import('./pages/TradeupsPrivate'));

const App = () => {
	const [isAuthenticated, setIsAuthenticated] = useState(false);
	const [isLoading, setIsLoading] = useState(true);
  
	useEffect(() => {
	  // Check authentication status when the app loads
	  checkAuthStatus();
	}, []);

	const checkAuthStatus = async () => {
		setIsLoading(true);
		try {
			const response = await fetch('/check-auth', {
			method: 'GET',
			credentials: 'include', // Important for sending cookies
			})
			.then(response => {
				if(!response.ok) throw new Error(response.status);
				else return response.json();
			})
			.then(jsonData => {
				console.log('Authenticated: ' + jsonData.authenticated);
				setIsAuthenticated(jsonData.authenticated);
			})
			.catch((error) => {
				alert('error: ' + error);
			});
		} catch (error) {
			console.error('Error checking authentication status:', error);
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
					<Route path="/about" element={<About />} />
					<Route path="/login" element={<Login setIsAuthenticated={setIsAuthenticated} />} />

					<Route path="/tradeups" element={<Tradeups isAuthenticated={isAuthenticated} />}>
						<Route path="public" element={<TradeupsPublic />} />
						<Route element={<ProtectedRoute isAuthenticated={isAuthenticated} />}>
							<Route path="purchasable" element={<TradeupsPurchasable />} />
							<Route path="tracked" element={<TradeupsPrivate />} />
						</Route>
					</Route>
				</Routes>
			</Suspense>
		</>
	);
};

export default App;