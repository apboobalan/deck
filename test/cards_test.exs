defmodule CardsTest do
  @moduledoc """
  Tests for Cards.
  """
  use ExUnit.Case
  doctest Deck.Cards
  alias Deck.{Card, Cards}

  setup_all do
    cards = [
      Card.new({"AH", 12}),
      Card.new({"KH", 11}),
      Card.new({"AC", 38}),
      Card.new({"AD", 25}),
      Card.new({"AA", 51}),
      Card.new({"KA", 50})
    ]

    {:ok, cards: cards}
  end

  test "sort given cards", state do
    cards_sorted = [
      Card.new({"KH", 11}),
      Card.new({"AH", 12}),
      Card.new({"AD", 25}),
      Card.new({"AC", 38}),
      Card.new({"KA", 50}),
      Card.new({"AA", 51})
    ]

    assert cards_sorted == state[:cards] |> Cards.sort()
  end

  test "Get Card from the list", state do
    assert state[:cards] |> Cards.find_by_name("AA") == Card.new({"AA", 51})
  end

  test "Returns true if the given card is present in the set of cards", state do
    assert state[:cards] |> Cards.present?(Card.new({"AA", 51})) == true
  end

  test "Returns false if the given card is not present in the set of cards", state do
    assert state[:cards] |> Cards.present?(Card.new({"AH", 51})) == false
  end

  test "Split spades and other cards", state do
    other_faces = [
      Card.new({"AH", 12}),
      Card.new({"KH", 11}),
      Card.new({"AC", 38}),
      Card.new({"AD", 25})
    ]

    spades = [
      Card.new({"AA", 51}),
      Card.new({"KA", 50})
    ]

    assert {spades, other_faces} == state[:cards] |> Cards.split_spades()
  end

  test "Get all cards of the same face", state do
    same_heart_face_cards = [
      Card.new({"AH", 12}),
      Card.new({"KH", 11}),
    ]

    assert same_heart_face_cards == state[:cards] |> Cards.get_same_face_cards_as(Card.new({"2H", 0}))
  end
end
