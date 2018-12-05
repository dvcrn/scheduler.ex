# scheduler.ex

Simple Scheduler implemented in GenServer. Calls given functions every x.

## Installation


```elixir
def deps do
  [
    {:scheduler, "~> 0.2.0"}
  ]
end
```

## Configuration

```elixir
config :scheduler,
  scheduled_calls: [
    # 15 min
    {MyApp, :crawl_something, 0}, 900},

    # 1h
    {MyApp, :cleanup_database, 0}, 3600},

    # 6h
    {MyApp.Stats, :send, 0}, 21600},
  ]

```

