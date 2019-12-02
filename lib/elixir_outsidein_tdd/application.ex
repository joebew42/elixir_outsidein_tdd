defmodule ElixirOutsideinTdd.Application do
  use Application

  def start(_type, _opts) do
    children = []

    opts = [strategy: :one_for_one, name: ElixirOutsideinTdd.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
