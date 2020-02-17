defmodule GreetingService do
  def greet(user) do
    case user do
      nil ->
        "Hello my friend!"

      user ->
        message_for(user)
    end
  end

  defp message_for(user) do
    [
      "Hello {User}!",
      "Hey {User}, nice to see you here!",
      "{User} welcome back!",
      "Have a splendid day {User}.",
    ]
    |> Enum.random()
    |> String.replace("{User}", user)
  end
end