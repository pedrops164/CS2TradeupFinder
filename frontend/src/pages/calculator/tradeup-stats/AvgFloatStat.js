import '../../../styles/TradeupCalculator.css';
import floatIcon from '../../../assets/float_icon.png';

const AvgFloatStat = ({avgInputFloat}) => {

    return (
        <div className="stat-item">
            <div style={{display: 'flex', flexDirection: 'row'}}>
                <img className='stat-image' src={floatIcon} alt=''/>
                <span className="stat-name">Avg. Float</span>
            </div>
            <span className="stat-value">{avgInputFloat.toFixed(2)}</span>
        </div>
    )
};

export default AvgFloatStat;