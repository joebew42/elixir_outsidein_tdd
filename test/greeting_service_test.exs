defmodule GreetingServiceTest do
  use ExUnit.Case, async: true

  defmodule FakeMessagesService do
    def pick_one!() do
      "Hey {User}, nice to see you here!"
    end

    def pick_one_at!(hour) do
      "Morning message of the #{hour} AM for {User}."
    end
  end

  def hour_of_the_day_that_returns(hour) do
    Code.eval_quoted(
      quote do
        defmodule HourOfTheDay do
          def hour(), do: unquote(hour)
        end
      end
    )

    HourOfTheDay
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
      response = GreetingService.greet("Joe", FakeMessagesService, hour_of_the_day_that_returns(7))

      assert response == "Morning message of the 7 AM for Joe."
    end
  end

  describe "when the hour of the day is the 8 AM" do
    test "returns a customized message from the morning" do
      response = GreetingService.greet("Joe", FakeMessagesService, hour_of_the_day_that_returns(8))

      assert response == "Morning message of the 8 AM for Joe."
    end
  end

  describe "when the hour of the day is the 9 AM" do
    test "returns a customized message from the morning" do
      response =
        GreetingService.greet("Joe", FakeMessagesService, hour_of_the_day_that_returns(9))

      assert response == "Morning message of the 9 AM for Joe."
    end
  end
end
