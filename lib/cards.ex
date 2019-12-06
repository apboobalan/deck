defmodule Cards do
  @moduledoc """
  Provides public api for operations on cards
  """
  defdelegate sort(cards), to: Deck.Cards
  defdelegate find_by_name(cards, name), to: Deck.Cards
  defdelegate present?(cards, card), to: Deck.Cards
  defdelegate split_spades(cards), to: Deck.Cards
  defdelegate get_same_face_cards_as(cards, card), to: Deck.Cards
end
