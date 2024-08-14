import React from 'react';
import { NavLink, useNavigate } from 'react-router-dom';
import './../styles/Navbar.css';

const NavBar = ({ isAuthenticated, setIsAuthenticated }) => {
	const navigate = useNavigate();

	const handleLogout = async () => {
		const response = await fetch('/logout', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			}
		});

		if (response.ok) {
			setIsAuthenticated(false);
			alert('Logout successful');
			navigate('/login');
		} else {
			alert('Logout failed');
		}
	};

	return (
		<div>
			<nav>
				<div className="navbar">
					<div className="navbarEsq ">
						<NavLink className="navbarItem" to="/">Home</NavLink>
						<NavLink className="navbarItem" to="/about">About</NavLink>
                        <NavLink className="navbarItem" to="/tradeups">Tradeups</NavLink>
					</div>
					<div className="trapezoid-shadow">
						<div className="trapezoid">
							<NavLink to="/" className="tempTitle">TRADEUP APP</NavLink>
						</div>
					</div>

					<div className="navbarDir">
						{!isAuthenticated ? (
							<NavLink className="navbarItem" to="/login">Login</NavLink>
						) : (
							<button className="navbarItem logoutButton" onClick={handleLogout}>Logout</button>
						)}
					</div>
				</div>
			</nav>
		</div>
	);
};

export default NavBar;