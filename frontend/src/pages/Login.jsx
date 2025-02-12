import React, { useState } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
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
import { useUser } from '../contexts/UserProvider';

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [rememberMe, setRememberMe] = useState(false);
  const navigate = useNavigate();
  const location = useLocation();
  const { login } = useUser();

  const handleSubmit = async (e) => {
    e.preventDefault();
    const result = await login(email, password);
    if (result === 'fail') {
      alert('Invalid email or password');
    }
    else if (result === 'ok') {
      let next = '/';
      if (location.state && location.state.next) {
        next = location.state.next;
      }
      navigate(next);
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
