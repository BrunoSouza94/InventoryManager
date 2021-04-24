defmodule Inventorymanager.Supplies.GetByExpiration do
  import Ecto.Query

  alias Inventorymanager.{Supply, Restaurant, Repo}

  def call do
    today = Date.utc_today()
    firstDay = Date.beginning_of_week(today)
    lastDay = Date.end_of_week(today)

    query =
      from supply in Supply,
        where: supply.expiration_date >= ^firstDay and supply.expiration_date <= ^lastDay,
        preload: [:restaurant]

    query
    |> Repo.all()
    |> Enum.group_by(fn %Supply{restaurant: %Restaurant{email: email}} -> email end)
  end
end
