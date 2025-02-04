import '../../../styles/TradeupCalculator.css';
import profitOddsIcon from '../../../assets/profit_odds_icon.png';

const ProfitOddsStat = ({profitOdds}) => {
    return (
        <div className="stat-item">
            <div style={{display: 'flex', flexDirection: 'row'}}>
                <img className='stat-image' src={profitOddsIcon} alt=''/>
                <span className="stat-name">Profit Odds</span>
            </div>
            <span className="stat-value">{profitOdds.toFixed(2)}%</span>
        </div>
    )
};

export default ProfitOddsStat;