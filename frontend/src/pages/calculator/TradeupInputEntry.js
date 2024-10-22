import React from 'react';
import '../../styles/TradeupCalculator.css';
import default_skin_image from '../../assets/default_skin_image.png';

const TradeupInputEntry = ({ index, skin_name, skin_float, count, image_url, removeEntry }) => {
    return (
        <div className="entry">
            <div className="selected-skin">
                {/* Skin Image */}
                <img src={image_url ? image_url : default_skin_image} alt={skin_name} className="skin-image" />

                {/* Skin Details */}
                <div className="skin-details">
                    <span className="skin-name">{skin_name}</span>
                    <div className="float-count-container">
                        <span className="skin-float">Float: {skin_float}</span>
                        <span className="skin-count">Count: {count}</span>
                    </div>
                </div>

                <button onClick={() => removeEntry(index)} className='remove-entry-button'>X</button>
            </div>
        </div>
    );
};

export default TradeupInputEntry;
