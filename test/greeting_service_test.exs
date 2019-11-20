defmodule GreetingServiceTest do
  use ExUnit.Case, async: true

  defmodule FakeMessagesService do
    def pick_one!() do
      "Hey {User}, nice to see you here!"
    end

    def pick_one_at!(7) do
      "Morning message of the 7 AM for {User}."
    end

    def pick_one_at!(8) do
      "Morning message of the 8 AM for {User}."
    end

    def pick_one_at!(9) do
      "Morning message of the 9 AM for {User}."
    end
  end

  defmodule HourOfTheDayThatReturns7AM do
    def hour() do
      7
    end
  end

  defmodule HourOfTheDayThatReturns8AM do
    def hour() do
      8
    end
  end

  defmodule HourOfTheDayThatReturns9AM do
    def hour() do
      9
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

  describe "when the hour of the day is the 7 AM" do
    test "returns a customized message from the morning" do
      response = GreetingService.greet("Joe", FakeMessagesService, HourOfTheDayThatReturns7AM)

      assert response == "Morning message of the 7 AM for Joe."
    end
  end

  describe "when the hour of the day is the 8 AM" do
    test "returns a customized message from the morning" do
      response = GreetingService.greet("Joe", FakeMessagesService, HourOfTheDayThatReturns8AM)

      assert response == "Morning message of the 8 AM for Joe."
    end
  end

  describe "when the hour of the day is the 9 AM" do
    test "returns a customized message from the morning" do
      response = GreetingService.greet("Joe", FakeMessagesService, HourOfTheDayThatReturns9AM)

      assert response == "Morning message of the 9 AM for Joe."
    end
  end
end
