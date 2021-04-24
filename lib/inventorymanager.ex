defmodule Inventorymanager do
  alias Inventorymanager.Restaurants.Create, as: RestaurantCreate
  alias Inventorymanager.Supplies.Create, as: SupplyCreate
  alias Inventorymanager.Supplies.Get, as: GetSupply

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call

  defdelegate create_supply(params), to: SupplyCreate, as: :call

  defdelegate get_supply(params), to: GetSupply, as: :call
end
