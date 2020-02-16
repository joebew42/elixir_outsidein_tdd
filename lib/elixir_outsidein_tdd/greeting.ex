defmodule Greeting do
  def greet(nil) do
    "Hello my friend!"
  end

  def greet(name) do
    "Hello #{name}!"
  end
end