import React, {useState} from 'react';
import '../styles/Tradeup.css';

const TradeupCensored = ({ tradeup }) => {
    return (
        <div className="tradeup-box">
          <div className="tradeup-summary">
            <h3>{tradeup.tradeup_name}</h3>
            <p>Input Rarity: {tradeup.tradeup_input_rarity}</p>
            <p>Input Cost: {tradeup.input_skins_cost.toFixed(2)}€</p>
            <p>Profit Average Profit: {tradeup.profit_avg_pctg.toFixed(2)}%</p>
            <p>Profit Odds: {tradeup.profit_odds.toFixed(2)}%</p>
            <p>StatTrak: {tradeup.tradeup_stattrak ? 'Yes' : 'No'}</p>
          </div>
        </div>
      );
}

export default TradeupCensored;