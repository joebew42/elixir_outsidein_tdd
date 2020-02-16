defmodule GreetingFeaturesTest do
  use ExUnit.Case

  describe "When a greeting message is requested" do
    test "Then the system will reply with 'Hello my friend!'" do
      ElixirOutsideinTdd.Application.start(nil, [])

      response = HTTPoison.get!("http://localhost:4000/greet")

      assert response.status_code == 200
      assert response.body == "Hello my friend!"
    end
  end

  describe "When a User with the name Joe request a greeting message" do
    test "Then the system will reply with 'Hello Joe!'" do
      ElixirOutsideinTdd.Application.start(nil, [])

      response = HTTPoison.get!("http://localhost:4000/greet?name=Joe")

      assert response.status_code == 200
      assert response.body == "Hello Joe!"
    end
  end

end