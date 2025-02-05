import React from 'react';
import Box from '@mui/material/Box';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import default_skin_image from '../../assets/default_skin_image.png';

const TradeupInputEntry = ({ index, skin_name, skin_float, count, image_url, removeEntry }) => {
  return (
    <Box
      sx={{
        display: 'flex',
        alignItems: 'center',
        p: 2,
        m: 1,
        borderRadius: 2,
        borderColor: 'text.secondary',
        border: 1,
        boxShadow: 1,
        backgroundColor: 'primary.main',
        width: '100%',
      }}
    >
      {/* Skin Image */}
      <Box
        component="img"
        src={image_url || default_skin_image}
        alt={skin_name}
        sx={{
          width: 80,
          height: 80,
          borderRadius: 1,
          mr: 2,
        }}
      />

      {/* Skin Details */}
      <Box sx={{ flexGrow: 1 }}>
        <Typography variant="h6" sx={{ fontWeight: 'bold', color: 'text.primary' }}>
          {skin_name}
        </Typography>
        <Box sx={{ display: 'flex', gap: 2, mt: 1 }}>
          <Typography variant="body1" sx={{ color: 'text.secondary' }}>
            Float: {skin_float}
          </Typography>
          <Typography variant="body1" sx={{ color: 'text.secondary' }}>
            Count: {count}
          </Typography>
        </Box>
      </Box>

      {/* Remove Button */}
      <Button onClick={() => removeEntry(index)} sx={{ bgcolor: 'error.main' }}>
        X
      </Button>
    </Box>
  );
};

export default TradeupInputEntry;
