defmodule HTest do
  def run(args) do
    runner_id = Keyword.get(args, :runner_id, Enum.random(1000..10000))

    pid =
      Horde.DynamicSupervisor.start_child(
        HTest.DynamicSupervisor,
        %{
          id: HTest.NoServer,
          start: {HTest.NoServer, :start_link, [[runner_id: runner_id]]},
          restart: :temporary
        }
      )

    {runner_id, pid}
  end

  def status(runner_id) do
    Horde.Registry.lookup(HTest.Registry, runner_id)
  end
end
