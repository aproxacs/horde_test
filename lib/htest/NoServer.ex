defmodule HTest.NoServer do
  use GenServer

  require Logger

  def start_link(args) do
    runner_id = Keyword.get(args, :runner_id)
    GenServer.start_link(__MODULE__, args, name: HTest.Helper.runner_via(runner_id))
  end

  @impl true
  def init(args) do
    runner_id = Keyword.get(args, :runner_id)
    Logger.info(" ---> Start Server #{runner_id}")
    {:ok, {runner_id}}
  end

  @impl true
  def handle_call(:ping, _from, state) do
    Logger.info(" -> Hello")
    {:reply, {:ok, :pong}, state}
  end

  @impl true
  def terminate(reason, {runner_id}) do
    Logger.info(" ---> Stop Server #{runner_id}")
    :ok
  end
end
