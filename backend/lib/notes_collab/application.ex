defmodule NotesCollab.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      NotesCollabWeb.Telemetry,
      # Start the Ecto repository
      NotesCollab.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: NotesCollab.PubSub},
      # Start Finch
      {Finch, name: NotesCollab.Finch},
      # Start the Endpoint (http/https)
      NotesCollabWeb.Endpoint
      # Start a worker by calling: NotesCollab.Worker.start_link(arg)
      # {NotesCollab.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NotesCollab.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NotesCollabWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
