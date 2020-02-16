defmodule GreetingWeb do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/greet" do
    send_resp(conn, 200, "Hello my friend!")
  end

  match _ do
    send_resp(conn, 404, "the endpoint not exist")
  end
end