defmodule Deck.Card do
  @moduledoc """
  Struct for a card
  """
  @derive Jason.Encoder
  defstruct name: nil, value: nil

  def spade_face, do: "A"

  @doc """
  New Card.
  """
  def new({name, value}), do: %__MODULE__{name: name, value: value}

  @doc """
  Sort function.
  """
  def value(card), do: card.value

  @doc """
  Tell whethe two cards are of same face.
  """
  def same_face?(card1, card2), do: card1.name |> String.last == card2.name |> String.last
  # def same_face?(card1, card2), do: match(card1.name |> String.reverse(), card2.name |> String.reverse())
  # defp match(<<face::bytes-size(1), _::binary>>, <<face::bytes-size(1), _::binary>>), do: true
  # defp match(_, _), do: false
end
