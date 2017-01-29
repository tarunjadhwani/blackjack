require 'spec_helper'
require 'blackjack/entities/game.rb'

describe Game do
  it 'should have shuffled cards' do 
    cards = [Card.new('1', '2')]
    decks = []
    4.times do
      decks << Deck.new(cards)
    end
    game = Game.new(decks)
    expect(game).to respond_to(:deck_cards)
    expect(game.deck_cards).to eq(cards * 4)
  end

  it 'should have a dealer' do 
    cards = [Card.new('1', '2')]
    decks = []
    4.times do
      decks << Deck.new(cards)
    end
    game = Game.new(decks)
    expect(game).to respond_to(:dealer)
  end

  it 'should have a player' do 
    cards = [Card.new('1', '2')]
    decks = []
    4.times do
      decks << Deck.new(cards)
    end
    game = Game.new(decks)
    expect(game).to respond_to(:player)
  end
end