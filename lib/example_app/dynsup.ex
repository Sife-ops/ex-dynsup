defmodule ExampleApp.DynSup do
  use DynamicSupervisor

  # def start_link(init_arg) do
  #   DynamicSupervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  # end

  def start_child(init_arg) do
    IO.puts("dynsup start_child")
    spec = {ExampleApp.Client, init_arg}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end

  @impl true
  def init(lmao) do
    IO.puts("dynsup init")
    DynamicSupervisor.init([])
  end

end
