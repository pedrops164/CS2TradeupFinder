from backend.app.models import db, User, Tradeup, TradeupType, Skin, InputTradeupEntry, OutputTradeupEntry, SkinCondition
from backend.src.tradeups import calculate_output_entries

def test_get_tracked_tradeups(app, client, auth):
    # Log in the client as the test user
    auth.login_user()

    # Check the initial state of the tracked tradeups
    response = client.get("/tradeups/tracked")
    assert response.status_code == 200
    data = response.get_json()
    assert "result" in data
    assert isinstance(data["result"], list)
    assert len(data["result"]) == 0

    # Add a sample tradeup to the database
    # Query existing skins and conditions
    existing_skin = Skin.query.first()
    assert existing_skin is not None, "No existing skin found in the database."

    input_skin_condition = SkinCondition.query.filter_by(skin_id=existing_skin.id).first()
    assert input_skin_condition is not None, "No existing skin condition found for input entry."

    output_skin_condition = SkinCondition.query.filter_by(skin_id=existing_skin.id).filter(SkinCondition.condition != input_skin_condition.condition).first()
    assert output_skin_condition is not None, "No different skin condition found for output entry."

    # Add a sample tradeup to the database
    tradeup = Tradeup(
        name="Test Tradeup",
        stattrak=False,
        input_rarity=existing_skin.quality,
        tradeup_type=TradeupType.PRIVATE,
    )
    db.session.add(tradeup)
    db.session.commit()

    # Add input and output entries
    input_entry = InputTradeupEntry(
        skin_condition_id=input_skin_condition.id,
        skin_float=0.12,
        count=1,
        tradeup_id=tradeup.id,
    )
    output_entry = OutputTradeupEntry(
        skin_condition_id=output_skin_condition.id,
        skin_float=0.15,
        prob=0.5,
        tradeup_id=tradeup.id,
    )
    db.session.add_all([input_entry, output_entry])
    db.session.commit()

    # Get the test user
    user = User.query.filter_by(email=auth.get_email()).first()
    assert user is not None

    # Make the user track the tradeup
    user.tracked_tradeups.append(tradeup)
    db.session.commit()

    # Check the /tradeups/tracked route again
    response = client.get("/tradeups/tracked")
    assert response.status_code == 200
    data = response.get_json()
    assert "result" in data
    assert isinstance(data["result"], list)
    assert len(data["result"]) == 1

    # Verify the tracked tradeup details
    tracked_tradeup = data["result"][0]
    assert tracked_tradeup["tradeup_name"] == "Test Tradeup"
    assert tracked_tradeup["tradeup_input_rarity"] == existing_skin.quality


def test_calculate_tradeup_output(client, auth):
    # log in client as user
    auth.login_user()

    payload = {
        "stattrak": True,
        "input_rarity": "milspec_bg",
        "input_entries": [
                {
                    "skin_name": "M249 | Magma",
                    "skin_condition": "Battle-Scarred",
                    "skin_float": 0.46,
                    "count": 8,
                    "collection_id": 76
                },
                {
                    "skin_name": "Sawed-Off | Black Sand",
                    "skin_condition": "Minimal Wear",
                    "skin_float": 0.11,
                    "count": 2,
                    "collection_id": 45
                }
            ]
    }
    response = client.post("/tradeups/calculate_output", json=payload)
    assert response.status_code == 201
    data = response.get_json()
    assert "output" in data
    assert "avg_input_float" in data
    assert "tradeup_cost" in data
    assert "profit_avg" in data
    assert "profit_odds" in data
    assert len(data["output"]) == 9

def test_check_duplicate_tradeup(client, auth):
    # log in client as user
    auth.login_user()

    input_entries = [
            {
                "skin_name": "M249 | Magma",
                "skin_condition": "Battle-Scarred",
                "skin_float": 0.46,
                "count": 10,
                "collection_id": 76
            }
        ]

    duplicate_check_payload = {
        "input_entries": input_entries,
        "stattrak": True,
        "input_rarity": "milspec_bg",
        "tradeup_type": "private"
    }
    # check if this tradeup is duplicate. It hasn't been added yet, so it shouldn't be
    response = client.post("/tradeups/check_duplicate", json=duplicate_check_payload)
    assert response.status_code == 200
    data = response.get_json()
    assert data["is_duplicate"] == False

    # insert public tradeup using route /tradeups/create_public
    payload = {
        "name": "Test Tradeup",
        "stattrak": True,
        "input_rarity": "milspec_bg",
        "input_entries": input_entries
    }
    response = client.post("/tradeups/create_private", json=payload)
    assert response.status_code == 201

    # assert that tradeup is now duplicate
    response = client.post("/tradeups/check_duplicate", json=duplicate_check_payload)
    assert response.status_code == 200
    data = response.get_json()
    assert data["is_duplicate"] == True

def test_get_public_tradeups(client):
    response = client.get("/tradeups/public")
    assert response.status_code == 200
    data = response.get_json()
    assert "public_tradeups" in data
    assert len(data["public_tradeups"]) == 0
    assert isinstance(data["public_tradeups"], list)
