import React, {useState} from 'react';
import '../styles/Tradeup.css';
import InputTradeupEntry from './InputTradeupEntry';
import OutputTradeupEntry from './OutputTradeupEntry';
import defaultImage from '../assets/default_skin_image.png';

const Tradeup = ({ tradeup }) => {
    const [isExpanded, setIsExpanded] = useState(false);

    const toggleExpand = () => setIsExpanded(!isExpanded);

    return (
        <div className="tradeup-box">
          <div className="tradeup-summary">
            <h3>{tradeup.tradeup_name}</h3>
            <p>Collections: {tradeup.collection_names.join(', ')}</p>
            <p>Input Rarity: {tradeup.tradeup_input_rarity}</p>
            <p>Avg Input Float: {tradeup.avg_input_float.toFixed(2)}</p>
            <p>Input Cost: {tradeup.input_skins_cost.toFixed(2)}€</p>
            <p>Profit: {tradeup.profit_avg_pctg.toFixed(2)}%</p>
            <p>Profit Odds: {tradeup.profit_odds.toFixed(2)}%</p>
            <p>StatTrak: {tradeup.tradeup_stattrak ? 'Yes' : 'No'}</p>
            <button onClick={toggleExpand}>
              {isExpanded ? 'Hide Details' : 'Show Details'}
            </button>
          </div>
          {isExpanded && (
            <div className="tradeup-details">
              <div className="input-entries">
                <h4>Input Skins</h4>
                {tradeup.input_entries.map((entry, index) => (
                  <InputTradeupEntry key={index} entry={entry} defaultImage={defaultImage} />
                ))}
              </div>
              <div className="output-entries">
                <h4>Possible Outcomes</h4>
                {tradeup.output_entries.map((entry, index) => (
                  <OutputTradeupEntry key={index} entry={entry} defaultImage={defaultImage} />
                ))}
              </div>
            </div>
          )}
        </div>
      );
}

export default Tradeup;