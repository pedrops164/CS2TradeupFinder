from src.scripts.update_prices import update_skin_prices_white_market

def register_schedulers(scheduler, app):

    hours_interval = app.config['UPDATE_PRICES_HOURS_INTERVAL']
    minutes_interval = app.config['UPDATE_PRICES_MINUTES_INTERVAL']
    @scheduler.task('interval', id='update_prices_scheduler', hours=hours_interval, minutes=minutes_interval, max_instances=1)
    def register_update_prices_scheduler():
        with scheduler.app.app_context():
            update_skin_prices_white_market()
            scheduler.app.logger.info("Prices updated in scheduler")