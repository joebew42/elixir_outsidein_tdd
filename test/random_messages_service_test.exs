defmodule RandomMessagesServiceTest do
  use ExUnit.Case, async: true

  test "return a random message choosen from a predefined list" do
    assert [
             "Hello {User}!",
             "Hey {User}, nice to see you here!",
             "{User} welcome back!",
             "Have a splendid day {User}."
           ]
           |> Enum.member?(RandomMessagesService.pick_one!())
  end
end
