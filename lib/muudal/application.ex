defmodule Muudal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MuudalWeb.Telemetry,
      # Start the Ecto repository
      Muudal.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Muudal.PubSub},
      # Start Finch
      {Finch, name: Muudal.Finch},
      # Start the Endpoint (http/https)
      MuudalWeb.Endpoint
      # Start a worker by calling: Muudal.Worker.start_link(arg)
      # {Muudal.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Muudal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MuudalWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
