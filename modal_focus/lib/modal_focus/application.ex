defmodule ModalFocus.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ModalFocusWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:modal_focus, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ModalFocus.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ModalFocus.Finch},
      # Start a worker by calling: ModalFocus.Worker.start_link(arg)
      # {ModalFocus.Worker, arg},
      # Start to serve requests, typically the last entry
      ModalFocusWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ModalFocus.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ModalFocusWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
