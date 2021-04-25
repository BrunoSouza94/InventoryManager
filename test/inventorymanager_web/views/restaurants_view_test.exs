defmodule InventorymanagerWeb.RestaurantsViewTest do
  use InventorymanagerWeb.ConnCase, async: true

  import Phoenix.View

  alias Inventorymanager.Restaurant
  alias InventorymanagerWeb.RestaurantsView

  describe "render/2" do
    test "render create.json" do
      params = %{
        "name" => "Burguer King",
        "email" => "bk@bk.com"
      }

      {:ok, restaurant} = Inventorymanager.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "bk@bk.com",
                 id: _id,
                 inserted_at: _inserted_at,
                 name: "Burguer King",
                 updated_at: _updated_at
               }
             } = response
    end
  end
end
