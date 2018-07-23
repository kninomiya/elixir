defmodule ExCLI.Mixfile.Sample do
  use Mix.Project

  @version "0.1.4"

  def deps do
    [
       {:ex_cli, "~> 0.1.0"},
       {:excoveralls, "~> 0.8", only: :test},
       {:ecto, "~> 2.2"},
       {:number, "~> 0.5.7"},
       {:httpoison, "~> 1.2.0"},
       {:mojiex, github: "enpedasi/mojiex"},
       {:google_api_storage, "~> 0.0.2"},
       {:goth, ">= 0.9.0"}
    ]
  end

  def project do
    [app: :ex_cli_sample,
     version: @version,
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     description: "Sample App",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     test_coverage: [tool: ExCoveralls],
     test_pattern: "*_test.ex",
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
     deps: deps(),
     docs: [source_ref: "#{@version}", extras: ["README.md"], main: "readme"]]
  end

  defp elixirc_paths(:dev),  do: elixirc_paths(:test)
  defp elixirc_paths(:test), do: ["sample", "lib"]
  defp elixirc_paths(_all),  do: ["lib"]


  def application do
    [applications: applications(Mix.env)]
  end

  defp applications(:test) do
    applications(:all) ++ [:hackney]
  end
  defp applications(_all) do
    [:logger, :httpoison]
  end

  defp package do
    [
      maintainers: ["Fujikawa"],
      files: ["mix.exs"],
      licenses: ["MIT"]
    ]
  end
end
