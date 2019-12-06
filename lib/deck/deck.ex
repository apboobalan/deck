defmodule Deck.Deck do
  @moduledoc """
  Deck.
  """
  alias Deck.Card

  @doc """
  Generates a deck of 52 cards.
  """
  def new, do: card_names() |> add_value()

  defp add_value(deck), do: deck |> Enum.with_index |> Enum.map(&(Card.new(&1)))

  @doc """
  Generates a deck of card name.
  """
  def card_names do
    output_form = &("#{&1}#{&2}")
    output_form |> card_generator
  end

  @doc """
  Serve cards of `hand_size` to `hands`
  """
  def serve(hands, hand_size) do
    new() |> shuffle |> Enum.chunk_every(hand_size) |> Enum.take(hands)
  end

  defp shuffle(deck), do: deck |> Enum.shuffle
  defp card_generator(output_form) do
    for face <- ["H", "D", "C", "A"],
        value <- ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"] do
      output_form.(value, face)
    end
  end
end
