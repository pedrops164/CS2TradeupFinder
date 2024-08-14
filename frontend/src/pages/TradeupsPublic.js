import React, { useEffect, useState } from 'react';
import Tradeup from '../components/Tradeup';

const TradeupsPublic = () => {
  const [publicTradeups, setPublicTradeups] = useState([]);

  useEffect(() => {
    fetch('/tradeups/public')
      .then(response => response.json())
      .then(data => setPublicTradeups(data.public_tradeups))
      .catch(error => console.error('Error fetching public tradeups:', error));
  }, []);

  return (
    <div className="tradeup-subpage">
      <h2>Public Tradeups</h2>
      <div className="tradeup-list">
        {publicTradeups.map(tradeup => (
          <Tradeup key={tradeup.tradeup_id} tradeup={tradeup} />
        ))}
      </div>
    </div>
  );
};

export default TradeupsPublic;