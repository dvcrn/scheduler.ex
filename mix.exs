defmodule Scheduler.MixProject do
  use Mix.Project

  def project do
    [
      app: :scheduler,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  defp package do
    [
      name: :scheduler,
      files: ["lib", "config", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["David Mohl"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/dvcrn/scheduler.ex"},
      description: "Simple scheduler using GenServer"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Scheduler.Supervisor, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
