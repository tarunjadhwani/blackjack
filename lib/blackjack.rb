require "blackjack/version"
require "blackjack/entities/game"

module Blackjack
  @ranks = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K" ]
  @suits = [ "hearts", "spades", "clubs", "diamonds" ]
  @cards = []
  @decks = []

  game = Game.new
  def initialize 
    @ranks.product(@suits).each do |rank, suit|
      @cards << Card.new(rank, suit)
    end

    4.times do
      @decks << Deck.new(@cards)
    end
  end
  game.start
end
