defmodule ExampleApp do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  require Logger
  use Application

  @impl true
  def start(_type, args) do
    children = [
      {Registry, name: ExampleApp.Registry, keys: :unique},
      {DynamicSupervisor, name: ExampleApp.DynSup, strategy: :one_for_one}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExampleApp.Supervisor]
    Supervisor.start_link(children, opts)

    ###

    # for {k,v} <- args do
    #   Logger.debug(inspect(v))
    # end

    ExampleApp.DynSup.start_child("asdf")
  end
end
