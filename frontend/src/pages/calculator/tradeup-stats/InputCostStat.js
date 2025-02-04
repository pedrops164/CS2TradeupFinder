import '../../../styles/TradeupCalculator.css';
import costIcon from '../../../assets/cost_icon.png';

const InputCostStat = ({inputCost}) => {

    return (
        <div className="stat-item">
            <div style={{display: 'flex', flexDirection: 'row'}}>
                <img className='stat-image' src={costIcon} alt=''/>
                <span className="stat-name">Cost</span>
            </div>
            <span className="stat-value">${inputCost.toFixed(2)}</span>
        </div>
    )
};

export default InputCostStat;