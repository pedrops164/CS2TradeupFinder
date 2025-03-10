import unittest
from app import create_app, db
from app.models import User, UserRole, Tradeup, InputTradeupEntry, OutputTradeupEntry, private_tradeup_user, TradeupCollections, tradeup_purchase
from config import TestConfig, TestConfigWithAuth

class BaseTestCase(unittest.TestCase):
    config = TestConfig

    def setUp(self):
        self.app = create_app(self.config)
        self.app_context = self.app.app_context()
        self.app_context.push()
        db.create_all()

    def tearDown(self):
        # Cleanup: Delete all records from specified tables
        #tables_to_clear = ["tradeup", "input_tradeup_entry", "output_tradeup_entry", "private_tradeup_user", "tradeup_collections", "tradeup_purchase"]
        tables_to_clear = [private_tradeup_user, User, TradeupCollections, InputTradeupEntry, OutputTradeupEntry, Tradeup, tradeup_purchase]
        for table in tables_to_clear:
            #db.session.execute(text(f"DELETE FROM {table};"))
            db.session.query(table).delete()
        db.session.commit()
        db.session.close()
        #db.drop_all()
        self.app_context.pop()

class TestCaseAuthUser(BaseTestCase):
    config = TestConfig

    def setUp(self):
        super(TestCaseAuthUser, self).setUp()
        user = User(steam_id='user_test', email='user_test@example.com', role=UserRole.USER)
        db.session.add(user)
        db.session.commit()
        self.client = self.app.test_client()

class TestCaseAuthAdmin(BaseTestCase):
    config = TestConfig

    def setUp(self):
        super(TestCaseAuthAdmin, self).setUp()
        user = User(steam_id='admin_test', email='admin_test@example.com', role=UserRole.ADMIN)
        db.session.add(user)
        db.session.commit()
        self.client = self.app.test_client()