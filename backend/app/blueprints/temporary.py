from flask import Blueprint
from flask_login import login_required
import time

temp_bp = Blueprint('views', __name__)

@temp_bp.route("/home")
@login_required
def home():
    return "This is the home page"

@temp_bp.route("/time")
@login_required
def get_time():
    return {"timee": time.time()}