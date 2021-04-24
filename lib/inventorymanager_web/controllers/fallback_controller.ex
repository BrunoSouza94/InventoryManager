defmodule InventorymanagerWeb.FallbackController do
  use InventorymanagerWeb, :controller

  alias InventorymanagerWeb.ErrorView

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
