defmodule RandomMessagesServiceTest do
  use ExUnit.Case, async: true

  describe "when the hour is in the intervall between 7 and 11" do
    test "return a random message choosen from a predefined list" do
      Enum.each(7..11, fn hour ->
        assert [
          "Good morning, {User}! The sun is high and shining!",
          "Hey {User}, nice to see you here!",
          "{User} welcome back!",
          "Have a splendid day {User}."
        ]
        |> Enum.member?(RandomMessagesService.pick_one_at!(hour))
      end)
    end
  end

  describe "when the hour is in the intervall between 12 and 20" do
    test "return a random message choosen from a predefined list" do
      Enum.each(12..20, fn hour ->
        assert [
          "Hello {User}!",
          "You are great {User}"
        ]
        |> Enum.member?(RandomMessagesService.pick_one_at!(hour))
      end)
    end
  end

  describe "when the hour is in the intervall between 21 and 6" do
    test "return a random message choosen from a predefined list" do
      Enum.each([21, 22, 23, 0, 1, 2, 3, 4, 5, 6], fn hour ->
        assert [
          "Have a good night, {User}",
          "Wish you sweet dreams {User} ...",
          "It was a great day! {User} it's time to relax!"
        ]
        |> Enum.member?(RandomMessagesService.pick_one_at!(hour))
      end)
    end
  end
end
