defmodule ElixirOutsideinTdd.Application do
  use Application

  @opts [
    greeting_service: GreetingService,
    messages_service: RandomMessagesService,
    hour_of_the_day_service: nil
  ]

  def start(type, []) do
    start(type, @opts)
  end

  def start(type, hour_of_the_day_service: hour_of_the_day_service) do
    start(type, Keyword.merge(@opts, hour_of_the_day_service: hour_of_the_day_service))
  end

  def start(_type,
        greeting_service: greeting_service,
        messages_service: messages_service,
        hour_of_the_day_service: hour_of_the_day_service
      ) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: {
          GreetingServiceRouter,
          [
            greeting_service: greeting_service,
            messages_service: messages_service,
            hour_of_the_day_service: hour_of_the_day_service
          ]
        },
        options: [port: 4000]
      )
    ]

    opts = [strategy: :one_for_one, name: ElixirOutsideinTdd.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
