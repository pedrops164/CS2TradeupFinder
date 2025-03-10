from base_test_case import TestCaseAuthUser, TestCaseAuthAdmin

class InsertTestsAuthUser(TestCaseAuthUser):
    def test_add_tradeup(self):
        rv = self.client.post("/api/tradeups/create_public")
        # User with role USER should not be able to add public tradeups.
        # Also, the data wasnt given in the required schema, and that returns error 422
        assert rv.status_code == 403 or rv.status_code == 422

        # Attempt to create tradeup without providing data in the required format. Gives error 422
        rv = self.client.post("/api/tradeups/create_private")
        assert rv.status_code == 422

        # Attempt to create valid private tradeup
        rv = self.client.post("/api/tradeups/create_private", json={
            "stattrak": False,
            "input_rarity": "milspec_bg",
            "input_entries": [
                {
                    "skin_condition_id": 28,
                    "skin_float": 0.46,
                    "count": 10,
                }
            ]
        })
        assert rv.status_code == 201


    def test_track_tradeup(self):
        # Attempt to create valid private tradeup
        rv = self.client.post("/api/tradeups/create_private", json={
            "stattrak": False,
            "input_rarity": "milspec_bg",
            "input_entries": [
                {
                    "skin_condition_id": 28,
                    "skin_float": 0.46,
                    "count": 10,
                }
            ]
        })
        assert rv.status_code == 201

        # test max tracked tradeups hit limit
        # set app config max_tracked_tradeups to 1
        self.app.config['MAX_USER_TRACKED_TRADEUPS'] = 1
        # Attempt to create private tradeup (track tradeup), shouldnt work because user already tracks one tradeup
        rv = self.client.post("/api/tradeups/create_private", json={
            "stattrak": False,
            "input_rarity": "milspec_bg",
            "input_entries": [
                {
                    "skin_condition_id": 28,
                    "skin_float": 0.46,
                    "count": 10,
                }
            ]
        })
        assert rv.status_code == 403

    def test_untrack_tradeup(self):
        # Attempt to untrack tradeup that user doesnt track, should return 404
        rv = self.client.get("/api/tradeups/1/untrack")
        assert rv.status_code == 404

        # Attempt to create valid private tradeup
        rv = self.client.post("/api/tradeups/create_private", json={
            "stattrak": False,
            "input_rarity": "milspec_bg",
            "input_entries": [
                {
                    "skin_condition_id": 28,
                    "skin_float": 0.46,
                    "count": 10,
                }
            ]
        })
        assert rv.status_code == 201

        tradeup_id = rv.json['tradeup_id']

        # Attempt to untrack tradeup that user tracks, should return 204
        rv = self.client.get(f"/api/tradeups/{tradeup_id}/untrack")
        assert rv.status_code == 204

        # Attempt to untrack tradeup that doesnt exist
        rv = self.client.get(f"/api/tradeups/{tradeup_id}/untrack")
        assert rv.status_code == 404

class InsertTestsAuthAdmin(TestCaseAuthAdmin):
    def test_add_tradeup(self):
        # Attempt to create tradeup without providing data in the required format. Gives error 422
        rv = self.client.post("/api/tradeups/create_public")
        assert rv.status_code == 422

        # User with role ADMIN should be able to add public tradeups.
        rv = self.client.post("/api/tradeups/create_public", json={
            "stattrak": False,
            "input_rarity": "milspec_bg",
            "input_entries": [
                {
                    "skin_condition_id": 28,
                    "skin_float": 0.46,
                    "count": 10,
                }
            ]
        })
        assert rv.status_code == 201

    def test_remove_tradeup(self):
        # Attempt to remove tradeup that doesnt exist
        rv = self.client.get("/api/tradeups/1/remove")
        assert rv.status_code == 404

        # Attempt to create valid private tradeup
        rv = self.client.post("/api/tradeups/create_public", json={
            "stattrak": False,
            "input_rarity": "milspec_bg",
            "input_entries": [
                {
                    "skin_condition_id": 28,
                    "skin_float": 0.46,
                    "count": 10,
                }
            ]
        })
        assert rv.status_code == 201

        tradeup_id = rv.json['tradeup_id']

        # Attempt to untrack tradeup that user tracks, should return 204
        rv = self.client.get(f"/api/tradeups/{tradeup_id}/remove")
        assert rv.status_code == 204

        # Attempt to untrack tradeup that doesnt exist
        rv = self.client.get(f"/api/tradeups/{tradeup_id}/remove")
        assert rv.status_code == 404