import '../../../styles/TradeupCalculator.css';
import profitabilityIcon from '../../../assets/profitability_icon.png';

const ProfitabilityStat = ({profitability}) => {

    return (
        <div className="stat-item">
            <div style={{display: 'flex', flexDirection: 'row'}}>
                <img className='stat-image' src={profitabilityIcon} alt=''/>
                <span className="stat-name">Profitability</span>
            </div>
            <span className="stat-value">{profitability.toFixed(2)}%</span>
        </div>
    )
};

export default ProfitabilityStat;