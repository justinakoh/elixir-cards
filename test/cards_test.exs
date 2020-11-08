defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "shuffing a deck randomises it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck) #Can also use assert == instead of refute
  end

end
