defmodule Inventorymanager.Supplies.NotifyExpiration do
  alias Inventorymanager.Mailer
  alias Inventorymanager.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    Enum.each(data, fn {to_mail, supplies} ->
      to_mail
      |> ExpirationEmail.create(supplies)
      |> Mailer.deliver_later!()
    end)
  end
end
