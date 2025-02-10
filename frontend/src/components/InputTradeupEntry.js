import React from 'react';
import { Box, Paper, Typography } from '@mui/material';

const InputTradeupEntry = ({ entry, defaultImage }) => {
  const imageUrl = entry.image_url || defaultImage;

  return (
    <Paper elevation={2} sx={{ p: 2, mb: 2 }}>
      <Box sx={{ display: 'flex', alignItems: 'center' }}>
        {/* Text Section */}
        <Box sx={{ flex: 1 }}>
          <Typography variant="subtitle1" sx={{ fontWeight: 'bold' }}>
            {entry.skin_name} ({entry.skin_condition})
          </Typography>
          <Typography variant="body2">Count: {entry.count}</Typography>
          <Typography variant="body2">
            Price: ${entry.price.toFixed(2)}
          </Typography>
          <Typography variant="body2">
            Float: {entry.skin_float.toFixed(2)}
          </Typography>
        </Box>
        {/* Image Section */}
        <Box
          component="img"
          src={imageUrl}
          alt={entry.skin_name}
          sx={{ width: 80, height: 'auto', ml: 2 }}
        />
      </Box>
    </Paper>
  );
};

export default InputTradeupEntry;