import { lazy, Suspense } from 'react';
import { Routes, Route } from 'react-router-dom';
import NavBar from './NavBar';
const Home = lazy(() => import('./Home'));
const About = lazy(() => import('./About'));
const Login = lazy(() => import('./Login'));

const App = () => {
	return (
		<>
			<NavBar />
			<Suspense fallback={<div className="container">Loading...</div>}>
				<Routes>
					<Route path="/" element={<Home />} />
					<Route path="/about" element={<About />} />
					<Route path="/login" element={<Login />} />
					<Route path="/logout"/>
				</Routes>
			</Suspense>
		</>
	);
};

export default App;