// assets
import floatIcon from '../../../assets/float_icon.png';
import costIcon from '../../../assets/cost_icon.png';
import profitabilityIcon from '../../../assets/profitability_icon.png';
import profitOddsIcon from '../../../assets/profit_odds_icon.png';

// mui imports
import Box from '@mui/material/Box';
import TradeupStat from './TradeupStat';

const TradeupStats = ({avgInputFloat, tradeupCost, profitability, profitOdds}) => {
    return (
        <Box sx={{
                display: 'flex',
                justifyContent: 'space-between',
                alignItems: 'center',
                p: 1,  // optional padding
            }}>
            <TradeupStat statValue={avgInputFloat} statName="Avg. Float" imageSrc={floatIcon} prefix="$" />
            <TradeupStat statValue={tradeupCost} statName="Input Cost" imageSrc={costIcon} prefix="$"/>
            <TradeupStat statValue={profitability} statName="Profitability" imageSrc={profitabilityIcon} suffix="%" />
            <TradeupStat statValue={profitOdds} statName="Profit Odds" imageSrc={profitOddsIcon} suffix="%" />
        </Box>
    );
};

export default TradeupStats;