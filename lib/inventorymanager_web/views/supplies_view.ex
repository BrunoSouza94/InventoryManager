defmodule InventorymanagerWeb.SuppliesView do
  use InventorymanagerWeb, :view

  def render("create.json", %{supply: supply}) do
    %{
      message: "Supply Added!",
      supply: supply
    }
  end

  def render("show.json", %{supply: supply}), do: %{supply: supply}
end
