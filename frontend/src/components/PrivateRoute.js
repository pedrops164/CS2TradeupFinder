//https://blog.miguelgrinberg.com/post/the-react-mega-tutorial-chapter-8-authentication

import { useLocation, Navigate } from 'react-router-dom';
import { useUser } from '../contexts/UserProvider';
import { useApi } from '../contexts/ApiProvider';

export default function PrivateRoute({ children }) {
  const { user } = useUser();
  const location = useLocation();
  const api = useApi();

  if (user === undefined) {
    return null;
  }
  else if (user) {
    return children;
  }
  else {
    const url = location.pathname + location.search + location.hash;
    return <Navigate to="/login" state={{next: url}} />
  }
}