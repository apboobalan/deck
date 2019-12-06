defmodule DeckTest do
  @moduledoc """
  Tests for Deck.
  """
  use ExUnit.Case
  doctest Deck
  alias Deck.Card

  test "Generates a deck with 52 cards" do
    deck = Deck.new()
    assert deck |> length == 52
    assert deck |> Enum.at(0) == Card.new({"2H", 0})
    assert deck |> Enum.at(51) == Card.new({"AA", 51})
  end

  test "Generate list of card_name" do
    card_names = Deck.card_names()
    assert card_names |> length == 52
    assert card_names |> Enum.at(0) == "2H"
    assert card_names |> Enum.at(51) == "AA"
  end

  test "serve `hand_size`(cards per player) cards to `hands`(players)" do
    hands = 4
    hand_size = 3
    serve = Deck.serve(hands, hand_size)
    assert serve |> length == hands
    assert serve |> List.first |> length == hand_size
  end
end
