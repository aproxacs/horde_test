defmodule HTest.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Cluster.Supervisor, [Application.get_env(:libcluster, :topologies)]},
      {
        Horde.Registry,
        keys: :unique, name: HTest.Registry, members: :auto
      },
      {Horde.DynamicSupervisor,
       strategy: :one_for_one, name: HTest.DynamicSupervisor, members: :auto}

      # {Cluster.Supervisor, [topologies, [name: HTest.ClusterSupervisor]]}
      # ..other children..
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: HTest.Supervisor)
  end
end
