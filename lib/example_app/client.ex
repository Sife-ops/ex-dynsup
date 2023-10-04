defmodule ExampleApp.Client do
  use GenServer

  def start_link(init_arg) do
    IO.puts("client start_link")
    GenServer.start_link(__MODULE__, :ok, name: v(init_arg))
  end

  def hello do
    IO.puts("lmao")
  end

  def crash(n) do
    GenServer.cast(v(n), {:crash})
  end

  @impl true
  def init(_init_arg) do
    # IO.puts(init_arg)
    IO.puts("client init")
    {:ok, []}
  end

  @impl true
  def handle_cast({:crash}, state) do
    _ = 1/1
    {:noreply, state}
  end

  defp v(n) do
    {:via, Registry, {ExampleApp.Registry, n}}
  end
end
