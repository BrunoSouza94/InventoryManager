defmodule Inventorymanager.Repo do
  use Ecto.Repo,
    otp_app: :inventorymanager,
    adapter: Ecto.Adapters.Postgres
end
