import React, { useEffect, useState } from 'react';
import Tradeup from '../components/Tradeup';
import TradeupCensored from '../components/TradeupCensored';

const TradeupsPurchasable = () => {
  const [purchasedTradeups, setPurchasedTradeups] = useState([]);
  const [nonpurchasedTradeups, setNonPurchasedTradeups] = useState([]);

  useEffect(() => {
    fetch('/tradeups/purchasable')
      .then(response => response.json())
      .then(data => {
        setPurchasedTradeups(data.purchased);
        setNonPurchasedTradeups(data.not_purchased);
      })
      .catch(error => console.error('Error fetching purchasable tradeups:', error));
  }, []);

  return (
    <div className="tradeup-subpage">
      <div className="tradeup-list">
        <h2>Acquired Tradeups</h2>
        {purchasedTradeups.map(tradeup => (
          <Tradeup key={tradeup.tradeup_id} tradeup={tradeup} />
        ))}
      </div>
      <div className="tradeup-list">
        <h2>Purchasable Tradeups</h2>
        {nonpurchasedTradeups.map(tradeup => (
          <TradeupCensored key={tradeup.tradeup_id} tradeup={tradeup} />
        ))}
      </div>
    </div>
  );
};

export default TradeupsPurchasable;