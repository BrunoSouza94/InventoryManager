defmodule InventorymanagerWeb.SuppliesController do
  use InventorymanagerWeb, :controller

  alias Inventorymanager.Supply

  alias InventorymanagerWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Inventorymanager.create_supply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- Inventorymanager.get_supply(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end
end
