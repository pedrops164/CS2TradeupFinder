import React from 'react';
import { Tooltip } from '@mui/material';

/**
 * A component that wraps its children in a tooltip (and a span wrapper) when disabled.
 * 
 * Props:
 * - disabled: boolean indicating if the child component is disabled.
 * - tooltipText: text to display when hovering over the disabled element.
 * - children: the component to wrap.
 */
const DisabledWrapper = ({ disabled, tooltipText, children }) => {
  if (!disabled) {
    // Render normally when not disabled.
    return children;
  }
  
  return (
    <Tooltip title={tooltipText}>
      {/* Wrap in a span so the tooltip can trigger even if the child is disabled */}
      <span style={{ display: 'inline-block' }}>
        {children}
      </span>
    </Tooltip>
  );
};

export default DisabledWrapper;
