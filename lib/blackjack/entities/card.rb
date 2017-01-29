class Card
  attr_accessor :rank, :suit

  def initialize rank, suit
    @rank = rank
    @suit = suit
  end

  def score
    if [2, 3, 4, 5, 6, 7, 8, 9, 10].include?(@rank)
      return @rank.to_i
    elsif @rank == 'A'
      return 11
    elsif ['J', 'Q', 'K'].include?(@rank)
      return 10
    end
  end
end