import React from 'react';
import { Helmet } from 'react-helmet';
import { Container, Box, Typography, Button } from '@mui/material';
import { useNavigate } from 'react-router-dom';

const Home = () => {
  const navigate = useNavigate();

  return (
    <>
      <Helmet>
        <title>CS2 Tradeup Finder - Profitable Tradeups & Tradeup Calculator</title>
        <meta
          name="description"
          content="Discover profitable CS2 tradeups and optimize your strategy with our advanced tradeup calculator. Explore public tradeups and track your own with precision."
        />
        <meta
          name="keywords"
          content="CS2 tradeups, profitable tradeups, tradeup calculator, CS2 profit, CS2 tradeup finder"
        />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      </Helmet>
      <Box sx={{ p: 2, backgroundColor: 'background.default' }}>
        <Container maxWidth="md" sx={{ py: 4 }}>
            <Box textAlign="center" mb={4}>
            <Typography variant="h3" component="h1" gutterBottom color="text.primary">
                Welcome to CS2 Tradeup Finder
            </Typography>
            <Typography variant="h6" color="text.secondary">
                Maximize your CS2 trading potential with our cutting-edge platform designed to discover and optimize profitable tradeups.
            </Typography>
            </Box>
            <Box mb={4}>
            <Typography variant="body1" color="text.primary">
                Whether you're a seasoned trader or just starting out, our app offers the tools you need to stay ahead. Explore two key features:
            </Typography>
            <Box component="ul" sx={{ pl: 2, textAlign: 'left' }}>
                <li>
                <Typography variant="body1" color="text.primary">
                    <strong>Tradeups:</strong> View a comprehensive list of public CS2 tradeups updated in real time. Find the best opportunities and track your favorite tradeups.
                </Typography>
                </li>
                <li>
                <Typography variant="body1" color="text.primary">
                    <strong>Calculator:</strong> Use our intuitive calculator to input your tradeup details and instantly see potential output entries, average profitability, profit odds, and more.
                </Typography>
                </li>
            </Box>
            <Typography variant="body1" mt={2} color="text.primary">
                Our user-friendly interface and data-driven insights empower you to make smarter tradeup decisions. Get ready to discover, calculate, and track your CS2 tradeups like never before.
            </Typography>
            </Box>
            <Box textAlign="center">
            <Button
                variant="contained"
                color="primary"
                sx={{ mr: 2 }}
                onClick={() => navigate('/tradeups')}
            >
                View Tradeups
            </Button>
            <Button
                variant="contained"
                color="primary"
                onClick={() => navigate('/calculator')}
            >
                Use Tradeup Calculator
            </Button>
            </Box>
        </Container>
      </Box>
    </>
  );
};

export default Home;
