The objective of this project is to create a tool that finds the best tradeups, that is, the tradeups with the highest profit percentage.
There are about 3500 skins in cs2, with their own exterior and StatTrak status, which makes a brute force approach not effective.
Therefore, the search space is decreased so as to decrease the computation time.

There are three services:
- backend (flask api)
- frontend (react)
- nginx (reverse proxy)

Run "docker-compose up -d --build" to run the three containers

Currently uses sqlite3 but it is expected to be changed to postgres in the future.