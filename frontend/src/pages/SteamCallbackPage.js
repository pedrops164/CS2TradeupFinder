//https://github.com/miguelgrinberg/react-microblog/blob/oauth/src/pages/SocialCallbackPage.js

import { useState, useEffect, useRef } from 'react';
import { Navigate, useLocation } from 'react-router-dom';
import { useUser } from '../contexts/UserProvider';

export default function SteamCallbackPage() {
  const { steamLogin } = useUser();
  const location = useLocation();
  const firstRender = useRef(true);

  const [redirectUrl, setRedirectUrl] = useState(null);
  const searchParams = new URLSearchParams(location.search);
  const claimed_id_url = searchParams.get('openid.claimed_id');
  const steam_id = claimed_id_url.split('/').pop();

  useEffect(() => {
    if (!firstRender.current) {
      return;
    }
    firstRender.current = false;

    (async () => {
      const result = await steamLogin(steam_id);
      if (result === 'fail') {
        //flash('Could not log you in.', 'danger');
        alert('Could not log you in.');
      }
      else if (result === 'ok') {
        let next = '/';
        if (location.state && location.state.next) {
          next = location.state.next;
        }
        setRedirectUrl(next);
      }

    })();
  }, [steamLogin, steam_id, location]);

  return redirectUrl === null ? null : <Navigate to={redirectUrl} />;
}