defmodule LiveViewNativeGuides.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LiveViewNativeGuidesWeb.Telemetry,
      LiveViewNativeGuides.Repo,
      {DNSCluster,
       query: Application.get_env(:live_view_native_guides, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LiveViewNativeGuides.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LiveViewNativeGuides.Finch},
      # Start a worker by calling: LiveViewNativeGuides.Worker.start_link(arg)
      # {LiveViewNativeGuides.Worker, arg},
      # Start to serve requests, typically the last entry
      LiveViewNativeGuidesWeb.Endpoint
    ]

    if Application.get_env(:kino_live_view, :enabled) do
      Kino.SmartCell.register(KinoLiveView.SmartCell)
    end

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveViewNativeGuides.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveViewNativeGuidesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
