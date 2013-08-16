defmodule WsElixir.Mixfile do
  use Mix.Project

  def project do
    [ app: :ws_elixir,
      version: "0.0.1",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [:ranch, :crypto, :cowboy, :gproc],
      mod: {WebSocketServer, []},
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [
      {:cowboy, "0.8.6", github: "extend/cowboy"},
      {:gproc, "0.2.16-19-g6f7f6c3", github: "esl/gproc"},
    ]
  end
end

