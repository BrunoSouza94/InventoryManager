defmodule InventorymanagerWeb.RestaurantsController do
  use InventorymanagerWeb, :controller

  alias Inventorymanager.Restaurant

  alias InventorymanagerWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Inventorymanager.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
