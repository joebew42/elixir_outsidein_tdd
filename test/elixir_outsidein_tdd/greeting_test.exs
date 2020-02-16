defmodule GreetingTest do
  use ExUnit.Case

  describe "when a name is given" do
    test "return a customized message for that name" do
      assert Greeting.greet("A_NAME") == "Hello A_NAME!"
    end
  end

  describe "when a name is not given" do
    test "return the default message" do
      assert Greeting.greet(nil) == "Hello my friend!"
    end
  end
end