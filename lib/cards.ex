# defmodule will create a module named cards - a module is a collection of functions
defmodule Cards do

  def create_deck do
    ["Ace", "Two", "Three"]
  end

  # Method which shuffles the deck of cards
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  #check whether the deck contains the card in it
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

end
