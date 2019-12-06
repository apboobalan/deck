defmodule MockDeck do
  @moduledoc """
  MockDeck.
  """

  @doc """
  Serve cards of `hand_size` to `hands`
  """
  def serve(hands, hand_size) do
    Deck.new() |> Enum.chunk_every(hand_size) |> Enum.take(hands)
  end

end
