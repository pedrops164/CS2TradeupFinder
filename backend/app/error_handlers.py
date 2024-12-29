from flask import jsonify
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def register_error_handlers(app):
    @app.errorhandler(429)
    def ratelimit_handler(e):
        """
        Custom error handler for rate limit exceeded (429 Too Many Requests) responses.
        Formats the error response to match existing error handling patterns.
        """
        logger.warning(f"Rate limit exceeded: {str(e.description)}")
        return jsonify({
            "error": "Rate limit exceeded: {}".format(str(e.description))
        }), 429