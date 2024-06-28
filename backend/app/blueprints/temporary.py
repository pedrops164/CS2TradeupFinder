from flask import Blueprint
import time

temp_bp = Blueprint('views', __name__)

@temp_bp.route("/home")
def home():
    return "This is the home page"

@temp_bp.route("/time")
def get_time():
    return {"timee": time.time()}