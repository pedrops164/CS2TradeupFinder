import React from 'react';
import { Box, Paper, Typography, Divider, Stack, Tooltip } from '@mui/material';

const OutputTradeupEntry = ({ entry, defaultImage, tradeup_cost }) => {
  const imageUrl = entry.image_url || defaultImage;
  
  // Parse the skin name into weapon name and paint name
  const [weaponName, paintName] = entry.skin_name.split('|').map(text => text.trim());

  return (
    <Paper elevation={2} >
      <Box sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center', width: 150, border: '1px solid', borderColor: 'grey.800', borderRadius: 2 }}>
        {/* Skin Image */}
        <Box component="img" src={imageUrl} alt={entry.skin_name} sx={{ width: 150 }}/>

        <Divider sx={{ width: '100%' }} />

        {/* Skin Name: Weapon and Paint */}
        <Stack direction="column" spacing={-0.5} sx={{ justifyContent: 'center', mt:1 }}>
          <Typography variant="subtitle1" sx={{ fontWeight: 'bold', textAlign: 'center', lineHeight: 1 }}>
            {weaponName}
          </Typography>
          <Typography variant="subtitle1" sx={{ textAlign: 'center', mb: 1 }}>
            {paintName}
          </Typography>
          <Typography variant="body2" sx={{ textAlign: 'center', fontSize: 13, lineHeight: 2}}>
            ({entry.skin_condition})
          </Typography>
        </Stack>

        <Divider sx={{ width: '100%' }} />

        {/* Float and Count Row */}
        <Box 
          sx={{ 
            display: 'flex', 
            justifyContent: 'space-around', 
            alignItems: 'center',
            width: '100%'
          }}
        >
          <Box sx={{ width: '100%', display: 'flex', flexDirection: 'row', alignItems: 'center' }}>
            <Tooltip title="Skin Float" arrow>
              <Typography variant="h6" sx={{ width: '50%', textAlign: 'center' }}>
                {entry.skin_float.toFixed(3)}f
              </Typography>
            </Tooltip>
            <Divider orientation="vertical" flexItem />
            <Tooltip title="Probability" arrow>
              <Typography variant="h6" sx={{ width: '50%', textAlign: 'center' }}>
                {entry.prob.toFixed(2)}%
              </Typography>
            </Tooltip>
          </Box>
        </Box>

        <Divider sx={{ width: '100%' }} />

        {/* Price */}
        <Typography variant="h5" sx={{ fontWeight: 'bold', height: '20%', textAlign: 'center'
          , color: entry.price > tradeup_cost ? 'success.main' : 'error.main' }}>
          ${entry.price.toFixed(2)}
        </Typography>
      </Box>
    </Paper>
  );
};

export default OutputTradeupEntry;