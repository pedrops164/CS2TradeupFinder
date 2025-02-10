import Box from '@mui/material/Box';
import Typography from '@mui/material/Typography';
import Paper from '@mui/material/Paper';

const TradeupStat = ({ statValue, statName, imageSrc, prefix = '', suffix = ''}) => {
  return (
    <Paper elevation={5}
        sx={{
            display: 'flex',
            flexDirection: 'column',
            flex: '1 1 0',
            padding: '10px',
            borderRadius: '5px',
            margin: '5px',
        }}>
        <Box sx={{display: 'flex', flexDirection: 'row', alignItems: 'center', mb: '5px'}}>
            <Box component="img" src={imageSrc} alt="Float Icon"
                sx={{
                    width: '30px',
                    height: '30px',
                    mr: '5px',
                }}
            />
            <Typography sx={{display: 'inline-flex', alignItems: 'center'}}>
                {statName}
            </Typography>
        </Box>
        <Typography sx={{ fontWeight: 'bold', fontSize: '2em'}}>
        {prefix}{statValue.toFixed(2)}{suffix}
        </Typography>
    </Paper>
  );
};

export default TradeupStat;
