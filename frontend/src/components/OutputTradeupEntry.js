import React from 'react';

const OutputTradeupEntry = ({ entry, defaultImage }) => {
  const imageUrl = entry.image_url || defaultImage;

  return (
    <div className="entry">
      <div className="entry-content">
        <div className="entry-text">
          <p>{entry.skin_name} ({entry.skin_condition})</p>
          <p>Price: ${entry.price.toFixed(2)}</p>
          <p>Odd: {entry.prob.toFixed(2)}%</p>
          <p>Float: {entry.skin_float.toFixed(2)}</p>
        </div>
        <img src={imageUrl} alt={entry.skin_name} className="skin-image" />
      </div>
    </div>
  );
};

export default OutputTradeupEntry;
