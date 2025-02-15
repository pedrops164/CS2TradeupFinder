import { createContext, useContext, useState, useEffect, useCallback} from 'react';
import { useApi } from './ApiProvider';

const UserContext = createContext();

export default function UserProvider({ children }) {
  const [user, setUser] = useState();
  const api = useApi();

  useEffect(() => {
    (async () => {
      if (api.isAuthenticated()) {
        const response = await api.get('/me');
        setUser(response.ok ? response.body : null);
      }
      else {
        setUser(null);
      }
    })();
  }, [api]);

  const login = async (email, password) => {
    const result = await api.login(email, password);
    if (result === 'ok') {
      const response = await api.get('/me');
      setUser(response.ok ? response.body : null);
    }
    return result;
  };

  const oauth2Login = useCallback(async (provider, code, state) => {
    const result = await api.oauth2Login(provider, code, state);
    if (result === 'ok') {
      const response = await api.get('/me');
      setUser(response.ok ? response.body : null);
    }
    return result;
  }, [api]);

  const steamLogin = useCallback(async (steam_id) => {
    const result = await api.steamLogin(steam_id);
    if (result === 'ok') {
      const response = await api.get('/me');
      setUser(response.ok ? response.body : null);
    }
    return result;
  }, [api]);

  const logout = async () => {
    await api.logout();
    setUser(null);
  };

  return (
    <UserContext.Provider value={{ user, setUser, login, oauth2Login, steamLogin, logout }}>
      {children}
    </UserContext.Provider>
  );
}

export function useUser() {
  return useContext(UserContext);
}