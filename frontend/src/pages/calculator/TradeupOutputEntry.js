import React from 'react';
import '../../styles/TradeupCalculator.css';
import default_skin_image from '../../assets/default_skin_image.png';

const TradeupOutputEntry = ({ index, skin_name, skin_float, skin_prob, image_url }) => {
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
                        {/* Show probability with percentage */}
                        {skin_prob !== undefined && (
                            <span className="skin-prob">Probability: {skin_prob}%</span>  // Keep as percentage
                        )}
                    </div>
                </div>
            </div>
        </div>
    );
};

export default TradeupOutputEntry;
