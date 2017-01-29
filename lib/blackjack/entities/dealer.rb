require 'blackjack/entities/blackjacker.rb'

class Dealer < Blackjacker

  def hit 
    dealer.push deal_one_card
    formatted_dealer = format_cards dealer
    formatted_player = format_cards player
    stand dealer, player, "dealer"
  end
end