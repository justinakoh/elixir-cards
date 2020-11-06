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

end
