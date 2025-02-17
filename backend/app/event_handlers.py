from sqlalchemy import event
from .models import Tradeup
from .util import set_tradeup_stats

def register_event_handlers(app):

    @event.listens_for(Tradeup, "before_insert")
    def receive_before_insert_update(mapper, connection, target):
        set_tradeup_stats(target)