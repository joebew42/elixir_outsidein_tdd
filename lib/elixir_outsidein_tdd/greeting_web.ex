defmodule GreetingWeb do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/greet" do
    params = Plug.Conn.fetch_query_params(conn).query_params

    case params["name"] do
      nil ->
        send_resp(conn, 200, Greeting.greet())
      name ->
        send_resp(conn, 200, "Hello #{name}!")
    end
  end
end