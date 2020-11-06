# defmodule will create a module named cards - a module is a collection of functions
defmodule Cards do

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

end
