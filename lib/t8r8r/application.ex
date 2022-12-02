defmodule T8r8r.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      T8r8r.Repo,
      # Start the Telemetry supervisor
      T8r8rWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: T8r8r.PubSub},
      # Start the Endpoint (http/https)
      T8r8rWeb.Endpoint
      # Start a worker by calling: T8r8r.Worker.start_link(arg)
      # {T8r8r.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: T8r8r.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    T8r8rWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
