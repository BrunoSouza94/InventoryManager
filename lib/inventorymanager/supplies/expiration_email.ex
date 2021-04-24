defmodule Inventorymanager.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Inventorymanager.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "app@inventorymanager.com.br",
      subject: "Supplies that expires this week",
      html_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    initial_text = "<h1> Expiring Supplies </h1>"

    Enum.reduce(supplies, initial_text, fn supply, text -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "<div>" <>
      "<div> Description: #{description} </div>" <>
      "<div> Expires: #{expiration_date} </div>" <>
      "<div> Responsible: #{responsible} </div>" <>
      "</div>"
  end
end
