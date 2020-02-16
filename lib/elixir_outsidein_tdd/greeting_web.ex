defmodule GreetingWeb do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/greet" do
    send_resp(conn, 200, Greeting.greet())
  end
end