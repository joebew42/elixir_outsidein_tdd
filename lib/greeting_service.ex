defmodule GreetingService do
  def greet(_user, _messages_service \\ RandomMessagesService, _hour_of_the_day_service \\ nil)

  def greet(nil, _messages_service, _hour_of_the_day_service) do
    "Hello my friend!"
  end

  def greet(user, messages_service, hour_of_the_day_service) do
    hour_of_the_day_service.hour()
    |> messages_service.pick_one_at!()
    |> String.replace("{User}", user)
  end
end
