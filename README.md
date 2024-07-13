The objective of this project is to create a tool that finds the best tradeups, that is, the tradeups with the highest profit percentage.
There are about 3500 skins in cs2, with their own exterior and StatTrak status, which makes a brute force approach not effective.
Therefore, the search space is decreased so as to decrease the computation time.

To install:

1. Create Virtual Environment
2. run "pip install -r requirements.txt"
5. Go to frontend directory
6. Run "npm install" (after that, if needed, run "npm audit fix --force")

Postgres setup:
- Need to install postgres
- Need to create the role (CREATE USER username WITH PASSWORD 'password';)
- Need to create the database (CREATE DATABASE tradeups;)
- Grant permission to role username (GRANT ALL PRIVILEGES ON SCHEMA public TO username;)

To run frontend:

1. Go to frontend directory
2. Run "npm start"

To run backend:
1. Go to backend directory
2. Run "flask run"