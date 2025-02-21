from flask import jsonify
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class NoPermissionError(Exception):
    def __init__(self, message="You do not have permission to access this resource."):
        self.message = f"Forbidden: {message}"
        self.status_code = 403
        super().__init__(self.message)

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
    
    @app.errorhandler(400)
    def bad_request_handler(e):
        """
        Custom error handler for bad request (400 Bad Request) responses.
        Formats the error response to match existing error handling patterns.
        """
        logger.warning(f"Bad request: {str(e.description)}")
        return jsonify({"error": "Bad request: {}".format(str(e.description))}), 400
    
    @app.errorhandler(NoPermissionError)
    def no_permission_handler(e):
        """
        Custom error handler for NoPermissionError exceptions.
        Formats the error response to match existing error handling patterns.
        """
        logger.warning(f"No permission: {str(e)}")
        return jsonify({"error": str(e)}), e.status_code
    
    @app.errorhandler(500)
    def server_error_handler(e):
        """
        Custom error handler for server error (500 Internal Server Error) responses.
        Formats the error response to match existing error handling patterns.
        """
        logger.error(f"Internal server error: {str(e.description)}")
        return jsonify({"error": "Internal server error"}), 500