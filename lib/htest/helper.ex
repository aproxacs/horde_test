defmodule HTest.Helper do
  def runner_via(runner_id) do
    {:via, Horde.Registry, {HTest.Registry, runner_id}}
  end
end
