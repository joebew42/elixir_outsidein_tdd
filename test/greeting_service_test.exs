defmodule GreetingServiceTest do
  use ExUnit.Case, async: true

  describe "when the user is nil" do
    test "it returns 'Hello my friend'" do
      assert GreetingService.greet(nil) == "Hello my friend!"
    end
  end

  describe "when the user is a_user" do
    test "it returns a random message" do
      assert [
        "Hello a_user!",
        "Hey a_user, nice to see you here!",
        "a_user welcome back!",
        "Have a splendid day a_user.",
      ] |> Enum.member?(GreetingService.greet("a_user"))
    end
  end
end