defmodule ElixirOutsideinTdd.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_outsidein_tdd,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ElixirOutsideinTdd.Application, []}
    ]
  end

  def elixirc_paths(:test), do: ["lib", "test/support"]
  def elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:mock, "~> 0.3.3"},
      {:mox, "~> 0.5.1"}
    ]
  end
end
