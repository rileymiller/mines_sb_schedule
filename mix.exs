defmodule MinesSbSchedule.MixFile do
  use Mix.Project

  def project do
    [
      app: :mines_sb_schedule,
      version: "0.1.1",
      elixir: "~> 1.3",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      escript: [main_module: Schedule.CLI],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
#  def application do
#    [
#      [applications: [:logger, :httpoison]]
#    ]
#  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.7"},
      {:floki, "~> 0.29.0"}
    ]
  end
end
