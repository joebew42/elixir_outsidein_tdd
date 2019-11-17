defmodule GreetingServiceFeaturesTest do
  use ExUnit.Case, async: true

  setup_all do
    ElixirOutsideinTdd.Application.start(nil, [])

    :ok
  end

  describe "when a request is made without a user" do
    test "the greeting server will replies with 'Hello my friend!'" do
      response = HTTPoison.get!("http://localhost:4000/greet")

      assert response.body == "Hello my friend!"
    end
  end

  describe "when a request is made with a user Joe" do
    test "the greeting server will replies with a greeting message randomly choosen" do
      response = HTTPoison.get!("http://localhost:4000/greet?user=Joe")

      assert [
               "Hello Joe!",
               "Hey Joe, nice to see you here!",
               "Joe welcome back!",
               "Have a splendid day Joe."
             ]
             |> Enum.member?(response.body)
    end
  end
end
