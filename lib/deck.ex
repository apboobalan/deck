defmodule Deck do
  @moduledoc """
  Deck API.
  """
  alias Deck.Deck

  defdelegate new, to: Deck
  defdelegate card_names, to: Deck
  defdelegate serve(hand, hand_size), to: Deck
end
