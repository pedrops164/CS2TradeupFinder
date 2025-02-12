//https://github.com/miguelgrinberg/react-microblog/blob/oauth/src/pages/SocialCallbackPage.js

import { useState, useEffect, useRef } from 'react';
import { useParams, Navigate, useLocation } from 'react-router-dom';
import { useUser } from '../contexts/UserProvider';

export default function SocialCallbackPage() {
  const { oauth2Login } = useUser();
  const location = useLocation();
  const firstRender = useRef(true);

  const [redirectUrl, setRedirectUrl] = useState(null);
  const { provider } = useParams();
  const searchParams = new URLSearchParams(location.search);
  const code = searchParams.get('code');
  const state = searchParams.get('state');


  useEffect(() => {
    if (!firstRender.current) {
      return;
    }
    firstRender.current = false;

    (async () => {
      const result = await oauth2Login(provider, code, state);
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
  }, [oauth2Login, provider, code, state, location]);

  return redirectUrl === null ? null : <Navigate to={redirectUrl} />;
}