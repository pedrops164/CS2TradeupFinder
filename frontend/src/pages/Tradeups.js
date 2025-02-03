import React from 'react';
import { NavLink, Outlet, useLocation } from 'react-router-dom';
import '../styles/Tradeups.css'; // Create this CSS file

const Tradeups = ({ isAuthenticated }) => {
    const location = useLocation();
    const isSubpageSelected = location.pathname !== '/tradeups';
  
    return (
        <div className="tradeups-container">
          <h1>Tradeups</h1>
          <div className="tradeups-nav">
            <NavLink to="/tradeups/public" className="tradeups-nav-item">
              <h3>Public</h3>
              <p>Show all publicly available tradeups, free of charge</p>
            </NavLink>
            <NavLink to="/tradeups/purchasable" className={`tradeups-nav-item ${!isAuthenticated ? 'disabled' : ''}`} onClick={(e) => !isAuthenticated && e.preventDefault()}>
              <h3>Purchasable</h3>
              <p>Browse tradeups available for purchase</p>
            </NavLink>
            <NavLink to="/tradeups/purchased" className={`tradeups-nav-item ${!isAuthenticated ? 'disabled' : ''}`} onClick={(e) => !isAuthenticated && e.preventDefault()}>
              <h3>Purchased</h3>
              <p>Browse purchased tradeups</p>
            </NavLink>
            <NavLink to="/tradeups/tracked" className={`tradeups-nav-item ${!isAuthenticated ? 'disabled' : ''}`} onClick={(e) => !isAuthenticated && e.preventDefault()}>
              <h3>Tracked</h3>
              <p>Access your tracked and private tradeups</p>
            </NavLink>
          </div>
          {isSubpageSelected && (
            <div className="tradeups-content">
              <Outlet />
            </div>
          )}
        </div>
      );
    };

export default Tradeups;