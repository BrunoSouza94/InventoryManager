defmodule Inventorymanager.RestaurantTest do
  use Inventorymanager.DataCase, async: true

  alias Ecto.Changeset
  alias Inventorymanager.Restaurant

  describe "changeset/1" do
    test "when all param are valid, returns a valid changeset" do
      params = %{
        "name" => "Burguer King",
        "email" => "bk@bk.com"
      }

      result = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{
                 name: "Burguer King",
                 email: "bk@bk.com"
               },
               valid?: true
             } = result
    end

    test "when name param is null, returns a invalid changeset and specific message" do
      params = %{
        "name" => nil,
        "email" => "bk@bk.com"
      }

      result = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{
                 email: "bk@bk.com"
               },
               valid?: false
             } = result

      assert errors_on(result) == %{name: ["can't be blank"]}
    end

    test "when name param is below minimum size, returns a invalid changeset and specific message" do
      params = %{
        "name" => "B",
        "email" => "bk@bk.com"
      }

      result = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{
                 name: "B",
                 email: "bk@bk.com"
               },
               valid?: false
             } = result

      assert errors_on(result) == %{name: ["should be at least 2 character(s)"]}
    end

    test "when email param is null, returns a invalid changeset and specific message" do
      params = %{
        "name" => "Burguer King",
        "email" => nil
      }

      result = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{
                 name: "Burguer King"
               },
               valid?: false
             } = result

      assert errors_on(result) == %{email: ["can't be blank"]}
    end

    test "when email param is not using the correct template, returns a invalid changeset and specific message" do
      params = %{
        "name" => "Burguer King",
        "email" => "bkbk.com"
      }

      result = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{
                 name: "Burguer King",
                 email: "bkbk.com"
               },
               valid?: false
             } = result

      assert errors_on(result) == %{email: ["has invalid format"]}
    end
  end
end
