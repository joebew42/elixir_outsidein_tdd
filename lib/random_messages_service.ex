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

  @night_messages [
    "Have a good night, {User}",
    "Wish you sweet dreams {User} ...",
    "It was a great day! {User} it's time to relax!"
  ]

  def pick_one_at!(hour) when hour >= 7 and hour <= 11 do
    Enum.random(@morning_messages)
  end

  def pick_one_at!(hour) when hour >= 12 and hour <= 20 do
    Enum.random(@afternoon_messages)
  end

  def pick_one_at!(_) do
    Enum.random(@night_messages)
  end
end
