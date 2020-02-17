defmodule GreetingServicePlug do
  use Plug.Router

  plug :match
  plug :dispatch, builder_opts()

  get "/greet" do
    params = Plug.Conn.fetch_query_params(conn).query_params

    send_resp(conn, 200, greeting_service(opts).greet(params["user"]))
  end

  defp greeting_service(opts) do
    opts[:greeting_service]
  end
end