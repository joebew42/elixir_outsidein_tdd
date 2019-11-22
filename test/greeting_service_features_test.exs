defmodule GreetingServiceFeaturesTest do
  use ExUnit.Case, async: true

  defmodule HourOfTheDayServiceThatReturns7 do
    def hour() do
      7
    end
  end

  setup_all do
    ElixirOutsideinTdd.Application.start(nil,
      hour_of_the_day_service: HourOfTheDayServiceThatReturns7
    )

    :ok
  end

  describe "when a request is made without a user" do
    test "the greeting service replies with 'Hello my friend!'" do
      response = HTTPoison.get!("http://localhost:4000/greet")

      assert response.body == "Hello my friend!"
    end
  end

  describe "when Joe request a message from 7 AM to 11 AM" do
    test "the greeting service replies with message choosen from a predefined list" do
      response = HTTPoison.get!("http://localhost:4000/greet?user=Joe")

      assert [
               "Good morning, Joe! The sun is high and shining!",
               "Hey Joe, nice to see you here!",
               "Joe welcome back!",
               "Have a splendid day Joe."
             ]
             |> Enum.member?(response.body)
    end
  end

  # describe "when a request is made from the user Joe during a time interval from 12 PM to 8 PM" do
  #   test "the greeting service replies with a greeting message choosen from a predefined list" do
  #     response = HTTPoison.get!("http://localhost:4000/greet?user=Joe")

  #     assert [
  #             "Hello {User}!",
  #             "You are great {User}"
  #            ]
  #            |> Enum.member?(response.body)
  #   end
  # end
end
