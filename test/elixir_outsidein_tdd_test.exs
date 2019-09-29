defmodule ElixirOutsideinTddTest do
  use ExUnit.Case
  doctest ElixirOutsideinTdd

  test "greets the world" do
    assert ElixirOutsideinTdd.hello() == :world
  end
end
