defmodule Inventorymanager.SupplyTest do
  use Inventorymanager.DataCase, async: true

  alias Ecto.Changeset
  alias Inventorymanager.Supply

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        "description" => "Some Description",
        "expiration_date" => "2021-04-24",
        "responsible" => "Some Name",
        "restaurant_id" => "570051a0-92de-4131-bd3b-ad08f8a7d16f"
      }

      result = Supply.changeset(params)

      assert %Changeset{
               changes: %{
                 description: "Some Description",
                 expiration_date: ~D[2021-04-24],
                 responsible: "Some Name",
                 restaurant_id: "570051a0-92de-4131-bd3b-ad08f8a7d16f"
               },
               valid?: true
             } = result
    end

    test "when expiration_date param is null, returns a invalid changeset and specific message" do
      params = %{
        "description" => "Some Description",
        "expiration_date" => nil,
        "responsible" => "Some Name",
        "restaurant_id" => "570051a0-92de-4131-bd3b-ad08f8a7d16f"
      }

      result = Supply.changeset(params)

      assert %Changeset{
               changes: %{
                 description: "Some Description",
                 responsible: "Some Name",
                 restaurant_id: "570051a0-92de-4131-bd3b-ad08f8a7d16f"
               },
               valid?: false
             } = result

      assert errors_on(result) == %{expiration_date: ["can't be blank"]}
    end

    test "when description param is null, returns a invalid changeset and specific message" do
      params = %{
        "description" => nil,
        "expiration_date" => "2021-04-24",
        "responsible" => "Some Name",
        "restaurant_id" => "570051a0-92de-4131-bd3b-ad08f8a7d16f"
      }

      result = Supply.changeset(params)

      assert %Changeset{
               changes: %{
                 expiration_date: ~D[2021-04-24],
                 responsible: "Some Name",
                 restaurant_id: "570051a0-92de-4131-bd3b-ad08f8a7d16f"
               },
               valid?: false
             } = result

      assert errors_on(result) == %{description: ["can't be blank"]}
    end

    test "when description param is below minimum size, returns a invalid changeset and specific message" do
      params = %{
        "description" => "ab",
        "expiration_date" => "2021-04-24",
        "responsible" => "Some Name",
        "restaurant_id" => "570051a0-92de-4131-bd3b-ad08f8a7d16f"
      }

      result = Supply.changeset(params)

      assert %Changeset{
               changes: %{
                 description: "ab",
                 expiration_date: ~D[2021-04-24],
                 responsible: "Some Name",
                 restaurant_id: "570051a0-92de-4131-bd3b-ad08f8a7d16f"
               },
               valid?: false
             } = result

      assert errors_on(result) == %{description: ["should be at least 3 character(s)"]}
    end

    test "when resposible param is null, returns a invalid changeset and specific message" do
      params = %{
        "description" => "Some Description",
        "expiration_date" => "2021-04-24",
        "responsible" => nil,
        "restaurant_id" => "570051a0-92de-4131-bd3b-ad08f8a7d16f"
      }

      result = Supply.changeset(params)

      assert %Changeset{
               changes: %{
                 expiration_date: ~D[2021-04-24],
                 description: "Some Description",
                 restaurant_id: "570051a0-92de-4131-bd3b-ad08f8a7d16f"
               },
               valid?: false
             } = result

      assert errors_on(result) == %{responsible: ["can't be blank"]}
    end

    test "when resposible param is below minimum size, returns a invalid changeset and specific message" do
      params = %{
        "description" => "Some Description",
        "expiration_date" => "2021-04-24",
        "responsible" => "a",
        "restaurant_id" => "570051a0-92de-4131-bd3b-ad08f8a7d16f"
      }

      result = Supply.changeset(params)

      assert %Changeset{
               changes: %{
                 expiration_date: ~D[2021-04-24],
                 description: "Some Description",
                 responsible: "a",
                 restaurant_id: "570051a0-92de-4131-bd3b-ad08f8a7d16f"
               },
               valid?: false
             } = result

      assert errors_on(result) == %{responsible: ["should be at least 2 character(s)"]}
    end

    test "when restaurant_id param is null, returns a invalid changeset and specific message" do
      params = %{
        "description" => "Some Description",
        "expiration_date" => "2021-04-24",
        "responsible" => "Some Name",
        "restaurant_id" => nil
      }

      result = Supply.changeset(params)

      assert %Changeset{
               changes: %{
                 expiration_date: ~D[2021-04-24],
                 description: "Some Description",
                 responsible: "Some Name"
               },
               valid?: false
             } = result

      assert errors_on(result) == %{restaurant_id: ["can't be blank"]}
    end
  end
end
