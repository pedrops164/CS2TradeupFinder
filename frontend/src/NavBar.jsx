import React from 'react';
import { NavLink, useNavigate } from 'react-router-dom';

const NavBar = () => {
	const navigate = useNavigate();

	const handleLogout = async () => {
	  const response = await fetch('/logout', {
		method: 'POST',
		headers: {
		  'Content-Type': 'application/json'
		}
	  });
  
	  if (response.ok) {
		alert('Logout successful');
		navigate('/login');
	  } else {
		alert('Logout failed');
	  }
	};

	return (
		<div>
			<nav>
				<div className="nav-items container">
					<div className="logo">
						<a href="/">
							<h1>TRADEUP APP</h1>
						</a>
					</div>
					<ul>
						<li>
							<NavLink to="/">Home</NavLink>
						</li>
						<li>
							<NavLink to="/about">About</NavLink>
						</li>
						<li>
							<NavLink to="/login">Login</NavLink>
						</li>
						<li>
							<button onClick={handleLogout}>Logout</button>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	);
};

export default NavBar;