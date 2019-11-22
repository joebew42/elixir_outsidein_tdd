defmodule GreetingServiceTest do
  use ExUnit.Case, async: true

  defmodule FakeMessagesService do
    def pick_one!(), do: "Hey {User}, nice to see you here!"

    def pick_one_at!(7), do: "Message of the 7 for {User}."
  end

  defmodule FakeHourOfTheDay do
    def hour(), do: 7
  end

  test "returns a 'Hello my friend!' when user is not provided" do
    response = GreetingService.greet(nil, FakeMessagesService)

    assert response == "Hello my friend!"
  end

  test "A customized messages is returned based on the hour of the day" do
    response = GreetingService.greet("Joe", FakeMessagesService, FakeHourOfTheDay)

    assert response == "Message of the 7 for Joe."
  end
end
