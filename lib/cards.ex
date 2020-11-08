# defmodule will create a module named cards - a module is a collection of functions
defmodule Cards do
  @moduledoc """
    Provide methods for creting and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # Iterating through to get every combination of all the elements: using a list comphrehension
    for suit <- suits, value <- values do
      "#{value} of  #{suit}"
    end
  end

  @doc """
    Shuffles a list of cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks whether the deck contains the card in it
  ## Examples

        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "Ace of  Spades")
        true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of  Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves the deck of cards using a certain filename
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)  #this (:erlang) is to invoke erlang code. This converts it to a form which can be saved
    File.write(filename, binary)
  end

  @doc """
    This loads a deck of cards with the specific filename
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end

  #This calls three methods written within this module one after another
  #It now uses the pipe operator
  def create_hand(hand_size) do
    #The same thing as above, but using the pipe operator
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
