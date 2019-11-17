defmodule RandomMessagesService do
  @messages [
    "Hello {User}!",
    "Hey {User}, nice to see you here!",
    "{User} welcome back!",
    "Have a splendid day {User}."
  ]

  def pick_one!() do
    Enum.random(@messages)
  end
end
