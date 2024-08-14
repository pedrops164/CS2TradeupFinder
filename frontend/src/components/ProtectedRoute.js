import React from 'react';
import { Navigate, Outlet } from 'react-router-dom';

const ProtectedRoute = ({ isAuthenticated, redirectPath = '/login' }) => {
    if (!isAuthenticated) {
        console.log('Not authenticated, redirecting to login');
        return <Navigate to={redirectPath} replace />;
    }

  return <Outlet />;
};

export default ProtectedRoute;