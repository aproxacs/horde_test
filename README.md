# HordeTest

It is to understand and test [horde](https://github.com/derekkraan/horde) functionanlity. 
Nodes are connected automatically through [libcluster](https://github.com/bitwalker/libcluster) Gossip strategy.

# How to run
Install dependencies
```
mix deps.get
```

Run node on each console
```
iex --name a@127.0.0.1 -S mix
iex --name b@127.0.0.1 -S mix
iex --name c@127.0.0.1 -S mix
```

Run a process 
```
iex> HTest.run([])
```
It will run NoServer process on the chosen node.


## For debugging
```
DeltaCrdt.read(HTest.DynamicSupervisor.Crdt)
DeltaCrdt.read(HTest.Registry.Crdt)

Horde.Registry.count(HTest.Registry)
Horde.Registry.processes(HTest.Registry)
```