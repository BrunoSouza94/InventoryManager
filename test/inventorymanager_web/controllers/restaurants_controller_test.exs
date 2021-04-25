defmodule InventorymanagerWeb.RestaurantsControllerTest do
  use InventorymanagerWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, create the restaurant", %{conn: conn} do
      params = %{
        "name" => "Burguer King",
        "email" => "bk@bk.com"
      }

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "bk@bk.com",
                 "id" => _id,
                 "name" => "Burguer King"
               }
             } = response
    end

    test "when name param is null, returns error", %{conn: conn} do
      params = %{
        "email" => "bk@bk.com"
      }

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert %{"message" => %{"name" => ["can't be blank"]}} = response
    end
  end
end
