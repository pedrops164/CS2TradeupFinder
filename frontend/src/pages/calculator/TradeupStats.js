import React from 'react';
import '../../styles/TradeupCalculator.css';

const TradeupStats = ({avgInputFloat, tradeupCost, profitability, profitOdds}) => {

    // Example stat values
    const stats = [
        { name: 'Average Input Float', value: avgInputFloat },
        { name: 'Tradeup Cost', value: tradeupCost },
        { name: 'Profitability', value: profitability },
        { name: 'Profit Odds', value: profitOdds },
    ];

    return (
        <div className="stats-container">
            {stats.map((stat, index) => (
                <div className="stat-item" key={index}>
                    <span className="stat-name">{stat.name}:</span>
                    <span className="stat-value">{stat.value}</span>
                </div>
            ))}
        </div>
    );
};

export default TradeupStats;