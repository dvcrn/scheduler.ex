defmodule Scheduler do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    config = Application.get_env(:scheduler, :scheduled_calls)

    spawn_link(fn ->
      Enum.each(config, fn {module, interval} ->
        :timer.apply_interval(:timer.seconds(interval), __MODULE__, :repeat, [module])
      end)

      :timer.sleep(:infinity)
    end)

    {:ok, config}
  end

  def repeat(mod) do
    mod.()
  end
end
