// Tradeup.js
import React from 'react';
import { Accordion, AccordionSummary, AccordionDetails, Typography, Box, Divider, Grid2 } from '@mui/material';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import InputTradeupEntry from './InputTradeupEntry';
import OutputTradeupEntry from './OutputTradeupEntry';
import defaultImage from '../assets/default_skin_image.png';

const Tradeup = ({ tradeup }) => {
  return (
    <Accordion>
      <AccordionSummary expandIcon={<ExpandMoreIcon />}>
        <Box sx={{ display: 'flex', flexDirection: 'column' }}>
          <Typography variant="h6" sx={{ fontWeight: 'bold', mb: 1 }}>{tradeup.tradeup_name}</Typography>
          <Typography variant="body2">
            Collections: {tradeup.collection_names.join(', ')}
          </Typography>
          <Typography variant="body2">
            Input Rarity: {tradeup.tradeup_input_rarity}
          </Typography>
          <Typography variant="body2">
            Avg Input Float: {tradeup.avg_input_float.toFixed(2)}
          </Typography>
          <Typography variant="body2">
            Input Cost: {tradeup.input_skins_cost.toFixed(2)}€
          </Typography>
          <Typography variant="body2">
            Average Return: {tradeup.profit_avg_pctg.toFixed(2)}%
          </Typography>
          <Typography variant="body2">
            Profit Odds: {tradeup.profit_odds.toFixed(2)}%
          </Typography>
          <Typography variant="body2">
            StatTrak: {tradeup.tradeup_stattrak ? 'Yes' : 'No'}
          </Typography>
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
