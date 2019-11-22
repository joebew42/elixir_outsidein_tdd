defmodule GreetingServiceFeaturesTest do
  use ExUnit.Case, async: false

  defmodule AnyHourOfTheDayService do
    def hour(), do: 0
  end

  defmodule HourOfTheDayServiceThatReturns7 do
    def hour(), do: 7
  end

  defmodule HourOfTheDayServiceThatReturns13 do
    def hour(), do: 13
  end

  describe "when a request is made without a user" do
    setup do
      start_server_with(AnyHourOfTheDayService)
      on_exit(fn -> stop_server() end)
      :ok
    end

    test "the greeting service replies with 'Hello my friend!'" do
      response = HTTPoison.get!("http://localhost:4000/greet")

      assert response.body == "Hello my friend!"
    end
  end

  describe "when Joe request a message from 7 AM to 11 AM" do
    setup do
      start_server_with(HourOfTheDayServiceThatReturns7)
      on_exit(fn -> stop_server() end)
      :ok
    end

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

  describe "when a request is made from the user Joe during a time interval from 12 PM to 8 PM" do
    setup do
      start_server_with(HourOfTheDayServiceThatReturns13)
      on_exit(fn -> stop_server() end)
      :ok
    end

    test "the greeting service replies with a greeting message choosen from a predefined list" do
      response = HTTPoison.get!("http://localhost:4000/greet?user=Joe")

      assert [
              "Hello {User}!",
              "You are great {User}"
             ]
             |> Enum.member?(response.body)
    end
  end

  defp stop_server do
    Application.stop(:elixir_outsidein_tdd)
    Process.sleep(100)
  end

  defp start_server_with(hour_of_the_day_service) do
    {:ok, _} = ElixirOutsideinTdd.Application.start(nil, hour_of_the_day_service: hour_of_the_day_service)
  end
end
