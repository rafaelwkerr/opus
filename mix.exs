defmodule Opus.MixProject do
  use Mix.Project

  def project do
    [
      app: :opus,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Opus.Application, []},
      extra_applications: [:logger, :runtime_tools, :exq, :exq_ui, :timex, :guardian]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.3"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 4.0"},
      {:timex, "~> 3.5"},
      {:exq, "~> 0.13.2"},
      {:exq_ui, "~> 0.10.0"},
      {:redix, ">= 0.9.3"},
      {:nanoid, "~> 2.0.1"},
      {:guardian, "~> 1.0"}
    ]
  end
end
