defmodule InventorymanagerWeb.RestaurantsView do
  use InventorymanagerWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created!",
      restaurant: restaurant
    }
  end
end
