defmodule Elixir132.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir132,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def deps do
    [{:cowboy, "~> 1.0.0"},
     {:plug, "~> 1.0"}]
  end

  def application do
    [applications: [:logger, :cowboy, :plug],
    mod: {Elixir132.Api, []}]
  end
end
