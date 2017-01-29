require 'spec_helper'
require 'blackjack/entities/deck.rb'

describe Deck do
  it 'should have correct initial values from ranks and suits' do
    deck = Deck.new
    expect(deck.ranks).to eq(["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K" ])
    expect(deck.suits).to eq([ "D", "C", "S", "H" ])
  end
end