import React, { useEffect, useState } from 'react';
import Tradeup from '../components/Tradeup';

const TradeupsPrivate = () => {
  const [privateTradeups, setPrivateTradeups] = useState([]);

  useEffect(() => {
    fetch('/api/tradeups/tracked')
      .then(response => response.json())
      .then(data => setPrivateTradeups(data.result))
      .catch(error => console.error('Error fetching tracked tradeups:', error));
  }, []);

  return (
    <div className="tradeup-subpage">
      <h2>Private Tradeups</h2>
      <div className="tradeup-list">
        {privateTradeups.map(tradeup => (
          <Tradeup key={tradeup.tradeup_id} tradeup={tradeup} />
        ))}
      </div>
    </div>
  );
};

export default TradeupsPrivate;