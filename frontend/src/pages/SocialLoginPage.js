// https://github.com/miguelgrinberg/react-microblog/blob/oauth/src/pages/SocialLoginPage.js

import { useParams } from 'react-router-dom';
import { useApi } from '../contexts/ApiProvider';

export default function SocialLoginPage() {
  const { provider } = useParams();
  const api = useApi();

  window.location.href = api.base_url + `/tokens/oauth2/${provider}`;
  return null;
}