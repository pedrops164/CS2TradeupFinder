// src/utils/logger.js
class Logger {
    static LOG_LEVELS = {
      DEBUG: 0,
      INFO: 1,
      WARN: 2,
      ERROR: 3
    };
  
    static config = {
      minLevel: 'DEBUG',
      enableConsole: true,
      app: 'default-app'
    };
  
    static initialize(config = {}) {
      Logger.config = { ...Logger.config, ...config };
      if (process.env.NODE_ENV === 'development') {
        console.debug('Logger initialized:', Logger.config);
      }
    }
  
    static shouldLog(level) {
      const configuredLevelValue = Logger.LOG_LEVELS[Logger.config.minLevel];
      const currentLevelValue = Logger.LOG_LEVELS[level];
      return currentLevelValue >= configuredLevelValue;
    }
  
    static log(level, message, extra = {}) {
      if (!Logger.config) {
        Logger.initialize();
      }
  
      if (!Logger.shouldLog(level)) {
        return;
      }
  
      const timestamp = new Date().toISOString();
      const consoleMethod = level === 'ERROR' ? 'error' 
        : level === 'WARN' ? 'warn' 
        : level === 'DEBUG' ? 'debug' 
        : 'log';
      
      // Only include extra if it has properties
      const hasExtra = Object.keys(extra).length > 0;
      
      console[consoleMethod](
        `[${timestamp.split('T')[1].split('.')[0]}] [${level}] ${message}`,
        ...(hasExtra ? [extra] : [])  // Spread extra only if it exists
      );
    }
  
    static error(message, extra = {}) {
      return Logger.log('ERROR', message, extra);
    }
  
    static warn(message, extra = {}) {
      return Logger.log('WARN', message, extra);
    }
  
    static info(message, extra = {}) {
      return Logger.log('INFO', message, extra);
    }
  
    static debug(message, extra = {}) {
      return Logger.log('DEBUG', message, extra);
    }
}

export default Logger;