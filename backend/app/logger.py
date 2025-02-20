# Configure logging
from logging.config import dictConfig
from flask import has_request_context, request
from flask.logging import default_handler
import logging

class RequestFormatter(logging.Formatter):
    def format(self, record):
        if has_request_context():
            record.url = request.url
            record.remote_addr = request.remote_addr
        else:
            record.url = None
            record.remote_addr = None

        return super().format(record)

def configure_logging():
    dictConfig({
        'version': 1,
        'formatters': {'default': {
            'format': '[%(asctime)s] %(levelname)s in %(module)s: %(message)s\n',
        }},
        'handlers': {'wsgi': {
            'class': 'logging.StreamHandler',
            'stream': 'ext://flask.logging.wsgi_errors_stream',
            'formatter': 'default'
        }},
        'root': {
            'level': 'INFO',
            'handlers': ['wsgi']
        }
    })

    #formatter = RequestFormatter(
    #    '[%(asctime)s] %(remote_addr)s requested %(url)s\n'
    #    '%(levelname)s in %(module)s: %(message)s'
    #)
    #default_handler.setFormatter(formatter)
    #root = logging.getLogger()
    #root.addHandler(default_handler)

