defmodule Bureaucrat.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bureaucrat,
      version: "0.2.10",
      elixir: "~> 1.10",
      description: "Generate Phoenix API documentation from tests",
      deps: deps(),
      package: package()
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      registered: [Bureaucrat.Recorder],
      mod: {Bureaucrat, []},
      env: [
        writer: Bureaucrat.MarkdownWriter,
        default_path: "API.md",
        paths: [],
        titles: [],
        env_var: "DOC"
      ]
    ]
  end

  defp deps do
    [
      {:plug, ">= 1.0.0"},
      {:poison, "~> 6.0"},
      {:phoenix, ">= 1.2.0", optional: true},
      {:ex_doc, "~> 0.19", only: :dev}
    ]
  end

  defp package do
    [
      files: ~w(lib mix.exs README.md UNLICENSE),
      maintainers: ["Roman Kuznietsov", "Opak Alex", "Arno Dirlam"],
      licenses: ["Unlicense"],
      links: %{"GitHub" => "https://github.com/api-hogs/bureaucrat"}
    ]
  end
end
