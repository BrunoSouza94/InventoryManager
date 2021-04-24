defmodule Inventorymanager do
  alias Inventorymanager.Restaurants.Create

  defdelegate create_restaurant(params), to: Create, as: :call
end
