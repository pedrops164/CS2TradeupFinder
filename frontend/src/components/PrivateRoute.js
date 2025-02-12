//https://blog.miguelgrinberg.com/post/the-react-mega-tutorial-chapter-8-authentication

import { useLocation, Navigate } from 'react-router-dom';
import { useUser } from '../contexts/UserProvider';

export default function PrivateRoute({ children }) {
  const { user } = useUser();
  const location = useLocation();

  if (user === undefined) {
    console.log('user is null');
    return null;
  }
  else if (user) {
    return children;
  }
  else {
    console.log('PrivateRoute', user, location.pathname, location.search, location.hash);
    const url = location.pathname + location.search + location.hash;
    return <Navigate to="/login" state={{next: url}} />
  }
}