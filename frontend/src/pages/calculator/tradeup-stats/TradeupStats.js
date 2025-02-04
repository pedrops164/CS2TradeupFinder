import '../../../styles/TradeupCalculator.css';
import AvgFloatStat from './AvgFloatStat';
import InputCostStat from './InputCostStat';
import ProfitabilityStat from './ProfitabilityStat';
import ProfitOddsStat from './ProfitOddsStat';

const TradeupStats = ({avgInputFloat, tradeupCost, profitability, profitOdds}) => {
    return (
        <div className="stats-container">
            <AvgFloatStat avgInputFloat={avgInputFloat} />
            <InputCostStat inputCost={tradeupCost} />
            <ProfitabilityStat profitability={profitability} />
            <ProfitOddsStat profitOdds={profitOdds} />
        </div>
    );
};

export default TradeupStats;