defmodule GreetingWeb do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/greet" do
    params = Plug.Conn.fetch_query_params(conn).query_params

    send_resp(conn, 200, Greeting.greet(params["name"]))
  end
end