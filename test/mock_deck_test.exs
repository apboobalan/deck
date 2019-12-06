defmodule MockDeckTest do
  @moduledoc """
  Tests for MockDeck.
  """
  use ExUnit.Case
  alias Deck.Card

  defp list_second(list), do: list |> Enum.at(1)

  test "serve `hand_size`(cards per player) cards to `hands`(players)" do
    hands = 4
    hand_size = 3
    serve = MockDeck.serve(hands, hand_size)
    assert serve |> length == hands
    assert serve |> List.first |> length == hand_size
    assert serve |> List.first |> List.first == Card.new({"2H", 0})
    assert serve |> list_second |> List.first == Card.new({"5H", 3})
  end
end
