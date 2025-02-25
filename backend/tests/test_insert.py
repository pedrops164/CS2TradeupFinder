from app.models import TradeupType, Tradeup, User

def test_create_tradeup_public(client, auth):
    auth.login_user()

    # create a mock tradeup
    mock_payload = {
        "name": "Test Tradeup",
        "stattrak": True,
        "input_rarity": "milspec_bg",
        "input_entries": [
            {
                "skin_name": "M249 | Magma",
                "skin_condition": "Battle-Scarred",
                "skin_float": 0.46,
                "count": 10,
                "collection_id": 76
            }
        ]
    }
    duplicate_check_payload = mock_payload.copy()
    duplicate_check_payload['tradeup_type'] = TradeupType.PUBLIC.value
    # assert the mock tradeup is not in the database
    response = client.post("/tradeups/check_duplicate", json=duplicate_check_payload)
    assert response.status_code == 200
    data = response.get_json()
    # if the tradeup is not in the database, then it should not be a duplicate
    assert data["is_duplicate"] == False

    # insert the mock tradeup in the database
    response = client.post("/tradeups/create_public", json=mock_payload)
    # assert the tradeup wasnt created successfully (the client has role user)
    assert response.status_code == 400

    # logout and authenticate as admin
    auth.logout()
    auth.login_admin()

    # insert again and assert that it was created successfully (the client has role admin)
    response = client.post("/tradeups/create_public", json=mock_payload)
    assert response.status_code == 201  

    # assert the tradeup is now in the database
    response = client.post("/tradeups/check_duplicate", json=duplicate_check_payload)
    assert response.status_code == 200
    data = response.get_json()
    # if the tradeup is now in the database, then it should be a duplicate
    assert data["is_duplicate"] == True

def test_create_tradeup_purchasable(client, auth):
    auth.login_user()

    # create a mock tradeup
    mock_payload = {
        "name": "Test Tradeup",
        "stattrak": True,
        "input_rarity": "milspec_bg",
        "input_entries": [
            {
                "skin_name": "M249 | Magma",
                "skin_condition": "Battle-Scarred",
                "skin_float": 0.46,
                "count": 10,
                "collection_id": 76
            }
        ],
        'price': 2
    }
    duplicate_check_payload = mock_payload.copy()
    duplicate_check_payload['tradeup_type'] = TradeupType.PURCHASABLE.value
    # assert the mock tradeup is not in the database
    response = client.post("/tradeups/check_duplicate", json=duplicate_check_payload)
    assert response.status_code == 200
    data = response.get_json()
    # if the tradeup is not in the database, then it should not be a duplicate
    assert data["is_duplicate"] == False

    # insert the mock tradeup in the database
    response = client.post("/tradeups/create_purchasable", json=mock_payload)
    # assert the tradeup wasnt created successfully (the client has role user)
    assert response.status_code == 400

    # logout and authenticate as admin
    auth.logout()
    auth.login_admin()

    # insert again and assert that it was created successfully (the client has role admin)
    response = client.post("/tradeups/create_purchasable", json=mock_payload)
    assert response.status_code == 201  

    # assert the tradeup is now in the database
    response = client.post("/tradeups/check_duplicate", json=duplicate_check_payload)
    assert response.status_code == 200
    data = response.get_json()
    # if the tradeup is now in the database, then it should be a duplicate
    assert data["is_duplicate"] == True

def test_create_tradeup_private(client, auth):
    auth.login_user()

    # create a mock tradeup
    mock_payload = {
        "name": "Test Tradeup",
        "stattrak": True,
        "input_rarity": "milspec_bg",
        "input_entries": [
            {
                "skin_name": "M249 | Magma",
                "skin_condition": "Battle-Scarred",
                "skin_float": 0.46,
                "count": 10,
                "collection_id": 76
            }
        ]
    }
    duplicate_check_payload = mock_payload.copy()
    duplicate_check_payload['tradeup_type'] = TradeupType.PRIVATE.value
    # assert the mock tradeup is not in the database
    response = client.post("/tradeups/check_duplicate", json=duplicate_check_payload)
    assert response.status_code == 200
    data = response.get_json()
    # if the tradeup is not in the database, then it should not be a duplicate
    assert data["is_duplicate"] == False

    # insert the mock tradeup in the database
    response = client.post("/tradeups/create_private", json=mock_payload)
    # assert the tradeup was created successfully (the client has role user, and private tradeups can be created by users)
    assert response.status_code == 201

    # assert the tradeup is now in the database
    response = client.post("/tradeups/check_duplicate", json=duplicate_check_payload)
    assert response.status_code == 200
    data = response.get_json()
    # if the tradeup is now in the database, then it should be a duplicate
    assert data["is_duplicate"] == True

    # logout and try to add as non authenticated user
    auth.logout()
    response = client.post("/tradeups/create_private", json=mock_payload)
    assert response.status_code == 302

def test_purchase_tradeup(client, auth):
    auth.login_admin()

    # create a mock tradeup
    mock_payload = {
        "name": "Test Tradeup",
        "stattrak": True,
        "input_rarity": "milspec_bg",
        "input_entries": [
            {
                "skin_name": "M249 | Magma",
                "skin_condition": "Battle-Scarred",
                "skin_float": 0.46,
                "count": 10,
                "collection_id": 76
            }
        ],
        "price": 2
    }

    # create purchasable tradeup
    response = client.post("/tradeups/create_purchasable", json=mock_payload)

    # assert the tradeup was created successfully
    assert response.status_code == 201
    tradeup_id = response.get_json()["tradeup_id"]
    # Get the tradeup
    tradeup = Tradeup.query.filter_by(id=tradeup_id).first()
    assert tradeup is not None
    # Get the test user
    user = User.query.filter_by(email=auth.get_email()).first()
    assert user is not None

    # assert the tradeup was not purchased yet
    assert tradeup not in user.tradeups_purchased

    # purchase the tradeup
    client.post(f'/tradeups/{tradeup_id}/purchase')

    # assert the tradeup was purchased successfully
    assert tradeup in user.tradeups_purchased

def test_track_tradeup(client, auth):
    auth.login_admin()

    # create a mock tradeup
    mock_payload = {
        "name": "Test Tradeup",
        "stattrak": True,
        "input_rarity": "milspec_bg",
        "input_entries": [
            {
                "skin_name": "M249 | Magma",
                "skin_condition": "Battle-Scarred",
                "skin_float": 0.46,
                "count": 10,
                "collection_id": 76
            }
        ]
    }

    # create public tradeup
    response = client.post("/tradeups/create_public", json=mock_payload)

    # assert the tradeup was created successfully
    assert response.status_code == 201
    tradeup_id = response.get_json()["tradeup_id"]
    # Get the tradeup
    tradeup = Tradeup.query.filter_by(id=tradeup_id).first()
    assert tradeup is not None
    # Get the test user
    user = User.query.filter_by(email=auth.get_email()).first()
    assert user is not None

    # assert the tradeup was not tracked yet
    assert tradeup not in user.tracked_tradeups

    # purchase the tradeup
    client.post(f'/tradeups/{tradeup_id}/track')

    # assert the tradeup was tracked successfully
    assert tradeup in user.tracked_tradeups