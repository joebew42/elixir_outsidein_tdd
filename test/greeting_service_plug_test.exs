defmodule GreetingServicePlugTest do
  use ExUnit.Case, async: true
  use Plug.Test

  defmodule FakeGreetingService do
    def greet("a_user") do
      "called with a_user"
    end

    def greet(nil) do
      "nil user"
    end
  end

  describe "GET /greet" do
    @opts GreetingServicePlug.init([
      greeting_service: FakeGreetingService
    ])

    test "the GreetingService is called with a nil user" do
      conn = conn(:get, "/greet")

      conn = GreetingServicePlug.call(conn, @opts)

      assert conn.status == 200
      assert conn.resp_body == "nil user"
    end
  end

  describe "GET /greet?user=a_user" do
    @opts GreetingServicePlug.init([
      greeting_service: FakeGreetingService
    ])

    test "the GreetingService is called with a_user" do
      conn = conn(:get, "/greet?user=a_user")

      conn = GreetingServicePlug.call(conn, @opts)

      assert conn.status == 200
      assert conn.resp_body == "called with a_user"
    end
  end
end