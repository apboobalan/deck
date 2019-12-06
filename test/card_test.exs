defmodule CardTest do
  @moduledoc """
  Tests for Card.
  """
  use ExUnit.Case
  doctest Deck.Card
  alias Deck.Card

  test "Generates new Card" do
    assert Card.new({"2H", 0}) == %Card{name: "2H", value: 0}
  end

  test "Get value of card" do
    assert Card.new({"AA", 51}) |> Card.value() == 51
  end

  test "Returns true if two cards are of same face" do
    assert Card.new({"AA", 51}) |> Card.same_face?(Card.new({"2A", 39})) == true
  end
  test "Returns false if two cards are of different faces" do
    assert Card.new({"AA", 51}) |> Card.same_face?(Card.new({"AH", 12})) == false
  end
end
