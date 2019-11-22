defmodule GreetingServiceRouter do
  use Plug.Router

  plug(:match)
  plug(:dispatch, builder_opts())

  get "/greet" do
    params = Plug.Conn.fetch_query_params(conn).query_params

    message =
      opts[:greeting_service].greet(
        params["user"],
        opts[:messages_service],
        opts[:hour_of_the_day_service]
      )

    send_resp(conn, 200, message)
  end
end
