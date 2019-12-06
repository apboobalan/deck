defmodule Deck.Cards do
  @moduledoc """
  Operations related to cards
  """
  alias Deck.Card

  @doc """
  Sort given cards
  """
  def sort(cards) do
    cards |> Enum.sort_by(&Card.value/1)
  end

  @doc """
  Find Card using name.
  """
  def find_by_name(cards, name), do: cards |> Enum.find(&(name == &1.name))

  @doc """
  Is Card present in set of cards.
  """
  def present?(cards, card), do: cards |> Enum.any?(&(card == &1))

  @doc """
  Splits Spades and other faces.
  """
  def split_spades(cards),
    do: cards |> Enum.split_with(&(Card.spade_face() == &1.name |> String.last()))

  @doc """
  Get same face cards as the given card.
  """
  def get_same_face_cards_as(cards, card), do: cards |> Enum.filter(&Card.same_face?(card, &1))
end
