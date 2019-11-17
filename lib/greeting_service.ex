defmodule GreetingService do
  def greet(_user, _messages_service \\ RandomMessagesService)

  def greet(nil, _messages_service) do
    "Hello my friend!"
  end

  def greet(user, messages_service) do
    messages_service.pick_one!()
    |> String.replace("{User}", user)
  end
end
