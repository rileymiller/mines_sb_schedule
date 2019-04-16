defmodule MinesSbSchedule.MixProject do
  use Mix.Project

  def project do
    [
      app: :mines_sb_schedule,
      version: "0.1.0",
      elixir: "~> 1.8",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      [applications: [:logger, :httpoison]]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 0.10.0"},
      {:floki, "~> 0.11.0"}
    ]
  end
end
