defmodule Inventorymanager.Supplies.NotifyExpiration do
  alias Inventorymanager.Mailer
  alias Inventorymanager.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    data
    |> Task.async_stream(fn {to_mail, supplies} -> send_email(to_mail, supplies) end)
    |> Stream.run()
  end

  def send_email(to_mail, supplies) do
    to_mail
    |> ExpirationEmail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
