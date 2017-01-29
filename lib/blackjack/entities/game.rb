require 'blackjack/entities/deck.rb'
require 'blackjack/entities/dealer.rb'
require 'blackjack/entities/player.rb'

class Game
  attr_accessor :deck_cards, :dealer, :player

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
    @deck_cards = @deck.cards
  end

  def start
    deal_two
    print_cards
    deal_cards
  end

  private
    def deal_one_card
      @deck_cards.sample
    end

    def format_cards cards
      formated_cards = []
      cards.each do |card|
        formated_cards.push card.rank.to_s + " of " + card.suit.to_s
      end
      formated_cards.join(", ")
    end

    def print_cards final = false
      formatted_player = format_cards @player.cards
      if final == true
        formatted_dealer = format_cards @dealer.cards
      else 
        formatted_dealer = @dealer.cards.first.rank.to_s + " of " + @dealer.cards.first.suit.to_s
      end
      puts "PLAYER: " + formatted_player + "       <===========>       " + "DEALER: " + formatted_dealer
    end

    def print_scores
      puts "PLAYER: " + @player.score.to_s + "       <===========>       " + "DEALER: " + @dealer.score.to_s
    end

    def deal_two
      2.times do
        @dealer.cards << deal_one_card
      end
      2.times do
        @player.cards << deal_one_card
      end
    end

    def hit type = "player"
      if type == "player"
        @player.cards << deal_one_card
        print_cards
        deal_cards
      elsif type == "dealer"
        @dealer.cards << deal_one_card
        stand
      end
    end

    def stand
      if @dealer.score > 21
        print_cards true
        print_scores
        puts "Dealer loss (BUSTED)"
        exit
      elsif @dealer.score <= 17
        hit "dealer"
      elsif @dealer.score > @player.score
        print_cards true
        print_scores
        puts "Dealer won"
        exit
      elsif @dealer.score < @player.score
        print_cards true
        print_scores
        puts "Player won"
        exit
      elsif @dealer.score == @player.score
        print_cards true
        print_scores 
        puts "Draw"
        exit
      end
    end

    def deal_cards
      if @player.score > 21
        puts "Player loss (BUSTED)"
        exit
      elsif @player.score < 22
        user_input = @player.get_input
        puts user_input
        if user_input == "HIT"
          hit
        elsif user_input == "STAND"
          stand
        end
      end
    end

    def blackjack
    end
end