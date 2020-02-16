defmodule GreetingWeb do
  use Plug.Router

  plug :match
  plug :dispatch, builder_opts()

  get "/greet" do
    params = Plug.Conn.fetch_query_params(conn).query_params

    send_resp(conn, 200, opts[:greeting].greet(params["name"]))
  end
end