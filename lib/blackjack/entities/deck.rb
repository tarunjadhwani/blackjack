require 'blackjack/entities/card.rb'

class Deck
  attr_accessor :cards
  attr_accessor :ranks
  attr_accessor :suits

  def initialize
    @ranks = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K" ]
    @suits = [ "hearts", "spades", "clubs", "diamonds" ]
    @cards = []
    ranks.product(suits).each do |rank, suit|
      @cards << Card.new(rank, suit)
    end
  end
end