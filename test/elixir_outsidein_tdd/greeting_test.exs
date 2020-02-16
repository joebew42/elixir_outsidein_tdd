defmodule GreetingTest do
  use ExUnit.Case

  describe "greet" do
    test "return 'Hello my friend!'" do
      assert Greeting.greet() == "Hello my friend!"
    end    
  end
end