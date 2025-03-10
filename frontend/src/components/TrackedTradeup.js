import React, {useState} from 'react';
import { Box, Button, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle } from '@mui/material';
import Tradeup from './Tradeup';

const TrackedTradeup = ({ tradeup, onTradeupUntrack }) => {
  const [open, setOpen] = useState(false);

  const handleClickOpen = () => setOpen(true);
  const handleClose = () => setOpen(false);

  const handleConfirmUntrack = async () => {
    setOpen(true);
    onTradeupUntrack(tradeup.id);
  };

  return (
    <Box sx={{ display: 'flex', flexDirection: 'row', alignItems: 'flex-start', gap: 2 }}>
      <Box sx={{ flex: 1 }}>
        <Tradeup tradeup={tradeup} />
      </Box>
      <Button sx={{mt: 9}} variant="contained" color="error" onClick={handleClickOpen}>
        Untrack
      </Button>
      <Dialog
        open={open}
        onClose={handleClose}
        aria-labelledby="confirm-untrack-dialog"
        aria-describedby="confirm-untrack-dialog-description"
      >
        <DialogTitle id="confirm-untrack-dialog">Confirm Untrack</DialogTitle>
        <DialogContent>
          <DialogContentText id="confirm-untrack-dialog-description">
            Are you sure you want to untrack this tradeup?
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>Cancel</Button>
          <Button onClick={handleConfirmUntrack} autoFocus>
            Confirm
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default TrackedTradeup;
