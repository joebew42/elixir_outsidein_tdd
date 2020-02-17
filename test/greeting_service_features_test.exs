defmodule GreetingServiceFeaturesTest do
  use ExUnit.Case

  setup_all do
    ElixirOutsideinTdd.Application.start(nil, nil)

    :ok
  end

  describe "When a greeting message is requested" do
    test "then the system will reply with 'Hello my friend!'" do
      response = HTTPoison.get!("http://localhost:4000/greet")

      assert response.body == "Hello my friend!"
    end
  end

  describe "When a User with the name Joe request a greeting message again" do
    test "Then the system will reply with message choosen randomly" do
      response = HTTPoison.get!("http://localhost:4000/greet?user=Joe")

      assert [
        "Hello Joe!",
        "Hey Joe, nice to see you here!",
        "Joe welcome back!",
        "Have a splendid day Joe.",
      ] |> Enum.member?(response.body)
    end
  end
end