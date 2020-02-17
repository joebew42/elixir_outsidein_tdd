defmodule ElixirOutsideinTdd.Application do
  use Application

  def start(_type, _opts) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: {
          GreetingServicePlug,
          [greeting_service: GreetingService]
        },
        options: [port: 4000]
      )
    ]

    opts = [strategy: :one_for_one, name: ElixirOutsideinTdd.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
