import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  Container,
  Paper,
  Typography,
  TextField,
  Checkbox,
  FormControlLabel,
  Button
} from '@mui/material';

const Login = ({ setIsAuthenticated }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [rememberMe, setRememberMe] = useState(false);
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    const response = await fetch('/api/login', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email, password, remember_me: rememberMe })
    });
    if (response.ok) {
      setIsAuthenticated(true);
      //alert('Login successful');
      navigate('/');
    } else {
      const errorData = await response.json();
      //alert('Login failed: ' + (errorData.error || 'Unknown error'));
    }
  };

  return (
    <Box
      sx={(theme) => ({
        minHeight: '100vh',
        backgroundColor: theme.palette.primary.main,
        display: 'flex',
        alignItems: 'center',
      })}
    >
      <Container maxWidth="sm">
        <Paper
          elevation={3}
          sx={(theme) => ({
            p: 4,
            backgroundColor: theme.palette.background.paper,
            color: theme.palette.text.primary,
          })}
        >
          <Typography variant="h4" align="center" gutterBottom>
            Login
          </Typography>
          <Box component="form" onSubmit={handleSubmit} noValidate sx={{ mt: 2 }}>
            <TextField
              fullWidth
              label="Email"
              variant="outlined"
              margin="normal"
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
              sx={(theme) => ({
                '& .MuiInputLabel-root': { color: theme.palette.text.secondary },
                '& .MuiOutlinedInput-root': { color: theme.palette.text.primary }
              })}
            />
            <TextField
              fullWidth
              label="Password"
              variant="outlined"
              margin="normal"
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
              sx={(theme) => ({
                '& .MuiInputLabel-root': { color: theme.palette.text.secondary },
                '& .MuiOutlinedInput-root': { color: theme.palette.text.primary }
              })}
            />
            <FormControlLabel
              control={
                <Checkbox
                  checked={rememberMe}
                  onChange={(e) => setRememberMe(e.target.checked)}
                  color="primary"
                />
              }
              label="Remember me"
              sx={(theme) => ({
                color: theme.palette.text.primary,
              })}
            />
            <Button type="submit" variant="contained" color="primary" fullWidth sx={{ mt: 2 }}>
              Login
            </Button>
          </Box>
        </Paper>
      </Container>
    </Box>
  );
};

export default Login;
