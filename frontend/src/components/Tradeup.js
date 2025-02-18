// Tradeup.js
import React from 'react';
import { Accordion, AccordionSummary, AccordionDetails, Typography, Box, Divider, Grid2, Stack } from '@mui/material';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import InputTradeupEntry from './InputTradeupEntry';
import OutputTradeupEntry from './OutputTradeupEntry';
import defaultImage from '../assets/default_skin_image.png';
import TradeupStats from '../pages/calculator/tradeup-stats/TradeupStats';
import { getRarityDisplay, getRarityColor } from '../utils/helperFunctions';

const Tradeup = ({ tradeup }) => {
  return (
    <Accordion>
      <AccordionSummary expandIcon={<ExpandMoreIcon />}>
        <Box sx={{ display: 'flex', flexDirection: 'column', width: '100%' }}>
          {/* <Typography variant="h6" sx={{ fontWeight: 'bold', mb: 1 }}>{tradeup.tradeup_name}</Typography> */}
          <Box sx={{ display: 'flex', flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' }}>
            <Stack direction="column" sx={{ width: '33%', textAlign: 'center' }}>
              {tradeup.collection_names.map((collection, index) => (
                <Typography key={index} variant="h6" sx={{ fontWeight: 'bold', color: 'grey' }}>
                  {collection}
                </Typography>
              ))}
            </Stack>
            <Divider orientation="vertical" flexItem />
            <Typography variant="h6" sx={{ fontWeight: 'bold', width: '33%', textAlign: 'center', color: getRarityColor(tradeup.tradeup_input_rarity) }}>
              {getRarityDisplay(tradeup.tradeup_input_rarity)}
            </Typography>
            <Divider orientation="vertical" flexItem />
            <Typography variant="h6" sx={{ fontWeight: 'bold', width: '33%', textAlign: 'center', color: '#c55206' }}>
              {tradeup.tradeup_stattrak ? 'StatTrak™' : 'Not StatTrak™'}
            </Typography>
          </Box>
          <TradeupStats avgInputFloat={tradeup.avg_input_float} tradeupCost={tradeup.input_skins_cost} profitability={tradeup.profit_avg_pctg} profitOdds={tradeup.profit_odds}/>
        </Box>
      </AccordionSummary>
      <AccordionDetails>
        <Box
          sx={{
            display: 'flex',
            flexDirection: { xs: 'column', md: 'row' },
            gap: 2,
          }}
        >
          {/* Left side: Input Skins */}
          <Box sx={{ flex: 1, width: '50%' }}>
            <Typography variant="h6" gutterBottom>
              Input Skins
            </Typography>
            <Grid2 container sx={{ display: 'flex', flexDirection: 'row', justifyContent: 'center', gap: 2, p: 2, border: '1px solid', borderRadius: 2 }}>
              {tradeup.input_entries.map((entry, index) => (
                <Grid2 key={index}>
                  <InputTradeupEntry key={index} entry={entry} defaultImage={defaultImage} />
                </Grid2>
              ))}
            </Grid2>
          </Box>
          <Divider sx={{ height: '100%', mb: 1 }} />
          {/* Right side: Possible Outcomes */}
          <Box sx={{ flex: 1, width: '50%' }}>
            <Typography variant="h6" gutterBottom>
              Possible Outcomes
            </Typography>
            <Grid2 container sx={{ display: 'flex', flexDirection: 'row', alignItems: 'center', gap: 2, p: 2, border: '1px solid', borderRadius: 2 }}>
              {tradeup.output_entries.map((entry, index) => (
                <Grid2 key={index}>
                  <OutputTradeupEntry key={index} entry={entry} defaultImage={defaultImage} tradeup_cost={tradeup.input_skins_cost}/>
                </Grid2>
              ))}
            </Grid2>
          </Box>
        </Box>
      </AccordionDetails>
    </Accordion>
  );
};

export default Tradeup;
