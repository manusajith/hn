defmodule HN.MixProject do
  use Mix.Project

  def project do
    [
      app: :hn,
      version: "0.1.0",
      elixir: ">= 1.13.1",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {HN.Application, []}
    ]
  end

  defp deps do
    [
      {:finch, "~> 0.13.0"},
      {:jason, "~> 1.4"}
    ]
  end
end
