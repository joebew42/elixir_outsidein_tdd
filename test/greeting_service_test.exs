defmodule GreetingServiceTest do
  use ExUnit.Case, async: true

  defmodule FakeMessagesService do
    def pick_one!() do
      "Hey {User}, nice to see you here!"
    end
  end

  test "returns a customized greeting message with the name of the user" do
    response = GreetingService.greet("Joe", FakeMessagesService)

    assert response == "Hey Joe, nice to see you here!"
  end

  test "returns a 'Hello my friend!' when user is not provided" do
    response = GreetingService.greet(nil, FakeMessagesService)

    assert response == "Hello my friend!"
  end
end
