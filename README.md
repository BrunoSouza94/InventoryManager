# Inventorymanager

To start your Phoenix server and use application:

  * Install dependencies with `mix deps.get`
  * Create an Postgres DB using -> username: "postgres", password: "postgres", port: 5432
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`
  * Use Insomnia or other API Client to send requests to the API
  * Routes:
     - http://localhost:4000/api/restaurants:
       + Create restaurant - POST -> Body -> JSON { "name": "name", "email": "email" } 
     - http://localhost:4000/api/supplies: 
       + Create supply - POST -> Body -> JSON {"restaurant_id": "restaurant_id", "description": "description", "expiration_date": "expiration_date", "responsible": "responsible"}
     - http://localhost:4000/api/supplies/id:
       + GET - Get specific supply
