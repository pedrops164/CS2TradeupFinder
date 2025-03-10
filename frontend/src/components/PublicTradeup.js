import React, {useState} from 'react';
import { Box, Button, CircularProgress, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle } from '@mui/material';
import Tradeup from './Tradeup';
import { useUser } from '../contexts/UserProvider';
import { useApi } from '../contexts/ApiProvider';

const PublicTradeup = ({ tradeup, onTradeupRemove }) => {
    const [open, setOpen] = useState(false);
    const [isTracking, setIsTracking] = useState(false);
    const { user } = useUser();
    const api = useApi();

    const handleClickOpen = () => setOpen(true); // set confirm dialog box to open
    const handleClose = () => setOpen(false); // set confirm dialog box to closed
    const handleConfirmRemove = async () => { // remove tradeup from list
        setOpen(false);
        onTradeupRemove(tradeup.id);
    };

    // Handler for tracking the tradeup
    const handleTrack = async () => {
      setIsTracking(true);
      try {
        // Call the API route to track the tradeup.
        const response = await api.get(`/tradeups/${tradeup.id}/track`);
        if (response.ok) {
          console.log('Tradeup tracked successfully');
          // Optionally trigger further UI updates or notifications here.
        } else {
          console.error('Failed to track tradeup:', response.body.error);
        }
      } catch (error) {
        console.error('Error tracking tradeup:', error);
      }
      setIsTracking(false);
    };

    return (
        <Box sx={{ display: 'flex', flexDirection: 'row', alignItems: 'flex-start', gap: 2 }}>
            <Box sx={{ flex: 1 }}>
                <Tradeup tradeup={tradeup} />
            </Box>
            {/* Track Button */}
            <Button sx={{mt: 9}} variant="contained" color="primary" onClick={handleTrack} disabled={isTracking}>
                {isTracking ? <CircularProgress size={24} /> : 'Track'}
            </Button>
            {user && user.role === 'admin' && (
                <>
                    <Button sx={{mt: 9}} variant="contained" color="error" onClick={handleClickOpen}>
                        Remove
                    </Button>
                    <Dialog
                        open={open}
                        onClose={handleClose}
                        aria-labelledby="confirm-untrack-dialog"
                        aria-describedby="confirm-untrack-dialog-description"
                    >
                        <DialogTitle id="confirm-untrack-dialog">Confirm Remove</DialogTitle>
                        <DialogContent>
                        <DialogContentText id="confirm-untrack-dialog-description">
                            Are you sure you want to remove this tradeup?
                        </DialogContentText>
                        </DialogContent>
                        <DialogActions>
                        <Button onClick={handleClose}>Cancel</Button>
                        <Button onClick={handleConfirmRemove} autoFocus>
                            Confirm
                        </Button>
                        </DialogActions>
                    </Dialog>
                </>
            )}
        </Box>
    );
};

export default PublicTradeup;
