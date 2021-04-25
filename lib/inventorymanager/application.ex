defmodule Inventorymanager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Inventorymanager.Repo,
      # Start the Telemetry supervisor
      InventorymanagerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Inventorymanager.PubSub},
      # Start the Endpoint (http/https)
      InventorymanagerWeb.Endpoint,
      # Start a worker by calling: Inventorymanager.Worker.start_link(arg)
      # {Inventorymanager.Worker, arg}
      Inventorymanager.Supplies.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Inventorymanager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    InventorymanagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
