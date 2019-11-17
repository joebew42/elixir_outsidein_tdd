defmodule GreetingServiceRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  defmodule FakeGreetingService do
    def greet(nil, _messages_service) do
      "Any message"
    end

    def greet("AnyUser", _messages_service) do
      "Any message"
    end
  end

  @opts GreetingServiceRouter.init(greeting_service: FakeGreetingService)

  describe "when no user is provided" do
    test "the GreetingService is called with no user" do
      conn = conn(:get, "/greet")

      conn = GreetingServiceRouter.call(conn, @opts)

      assert conn.resp_body == "Any message"
    end
  end

  describe "user is provided" do
    test "the GreetingService is called with the user" do
      conn = conn(:get, "/greet?user=AnyUser")

      conn = GreetingServiceRouter.call(conn, @opts)

      assert conn.resp_body == "Any message"
    end
  end
end
