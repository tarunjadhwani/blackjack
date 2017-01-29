require 'blackjack/entities/blackjacker.rb'

class Player < Blackjacker

  def get_input
    puts "1 for HIT, 2 for STAND & 9 to EXIT"
    input = gets.to_i
    case input
    when 1
      return "HIT"
    when 2
      return "STAND"
    when 9
      exit
    else 
      puts "INVALID INPUT"
      get_input
    end
  end
end