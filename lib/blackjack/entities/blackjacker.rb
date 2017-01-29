class Blackjacker
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def score
    score = 0
    @cards.each do |card|
      score += card.score.to_i
    end
    score
  end
end