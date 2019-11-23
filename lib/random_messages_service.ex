defmodule RandomMessagesService do
  @morning_messages [
    "Good morning, {User}! The sun is high and shining!",
    "Hey {User}, nice to see you here!",
    "{User} welcome back!",
    "Have a splendid day {User}."
  ]

  @afternoon_messages [
    "Hello {User}!",
    "You are great {User}"
  ]

  def pick_one_at!(hour) when hour >= 7 and hour <= 11 do
    Enum.random(@morning_messages)
  end

  def pick_one_at!(hour) when hour >= 12 and hour <= 20 do
    Enum.random(@afternoon_messages)
  end
end
