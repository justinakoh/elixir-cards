# defmodule will create a module named cards - a module is a collection of functions
defmodule Cards do
  @moduledoc """
    Provide methods for creting and handling a deck of cards
  """

  #Creates a new deck of cards
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # Iterating through to get every combination of all the elements: using a list comphrehension
    for suit <- suits, value <- values do
      "#{value} of  #{suit}"
    end
  end

  # Method which shuffles the deck of cards
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  #check whether the deck contains the card in it
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  #This deals a number of cards
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  #This saves it to a certain place
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)  #this (:erlang) is to invoke erlang code. This converts it to a form which can be saved
    File.write(filename, binary)
  end

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
