import React from 'react';
import Box from '@mui/material/Box';
import Typography from '@mui/material/Typography';
import Card from '@mui/material/Card';
import Paper from '@mui/material/Card';
import default_skin_image from '../../assets/default_skin_image.png';

const TradeupOutputEntry = ({ skin_name, skin_float, skin_prob, image_url }) => {
  return (
    <Card
    sx={{
        display: 'flex',
        alignItems: 'center',
        p: 2,
        m: 1,
        borderRadius: 2,
        border: 1,
        boxShadow: 1,
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
          {skin_prob !== undefined && (
            <Typography variant="body1" sx={{ color: 'text.secondary' }}>
              Probability: {skin_prob}%
            </Typography>
          )}
        </Box>
      </Box>
    </Card>
  );
};

export default TradeupOutputEntry;
