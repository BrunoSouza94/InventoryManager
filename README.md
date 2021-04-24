# Inventorymanager

To start your Phoenix server and use application:

  * Install dependencies with `mix deps.get`
  * Create an Postgres DB using -> username: "postgres", password: "postgres", port: 5432
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`
  * Use Insomnia to send requests to the api
  * Routes:
     http://localhost:4000/api/restaurants -> POST - Create restaurant
     http://localhost:4000/api/supplies -> POST - Create supply
     http://localhost:4000/api/supplies/id -> GET - Get specific supply
