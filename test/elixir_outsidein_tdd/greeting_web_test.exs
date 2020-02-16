defmodule GreetingWebTest do
  use ExUnit.Case, async: true
  use Plug.Test

  defmodule FakeGreeting do
    def greet(nil) do
      "called with nil"
    end

    def greet("A_NAME") do
      "called with A_NAME"
    end
  end

  @opts GreetingWeb.init([greeting: FakeGreeting])

  describe "GET /greet" do
    test "will call a greeting module with the value nil for the name" do
      conn = conn(:get, "/greet")

      conn = GreetingWeb.call(conn, @opts)

      assert conn.status == 200
      assert conn.resp_body == "called with nil"
    end
  end

  describe "GET /greet?name=A_NAME" do
    test "will call a greeting module with the value A_NAME for the name" do
      conn = conn(:get, "/greet?name=A_NAME")

      conn = GreetingWeb.call(conn, @opts)

      assert conn.status == 200
      assert conn.resp_body == "called with A_NAME"
    end
  end
end