require "blackjack/version"

module Blackjack
  def deck
    values = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K" ]
    suits = [ "hearts", "spades", "clubs", "diamonds" ]
    values.product(suits)
  end

  def deal_me_card
    deck.sample
  end

  def get_input
    puts "h for hit and s for stand"
    v = gets
    v.chomp
  end

  def count_score cards
    score = 0
    cards.each do |card|
      score += card[0].to_i
    end
    score
  end

  def format_cards cards
    formated_cards = []
    cards.each do |card|
      formated_cards.push card[0].to_s + " of " + card[1].to_s
    end
    formated_cards.join(", ")
  end

  def print_cards dealer, player
    puts "PLAYER: " + player + "       <===========>       " + "DEALER: " + dealer
  end

  def print_scores dealer, player
    puts "PLAYER: " + player + "       <===========>       " + "DEALER: " + dealer
  end

  def deal_two
    player_cards = []
    dealer_cards = []
    2.times do
      dealer_cards.push deal_me_card
    end
    2.times do
      player_cards.push deal_me_card
    end
    {dealer_cards: dealer_cards , player_cards: player_cards}
  end

  def deal_cards dealer_cards, player_cards
    formatted_dealer_cards = format_cards dealer_cards
    user_input = get_input
    if user_input == "h"
      player_cards.push deal_me_card
      formatted_player_cards = format_cards player_cards
      print_cards formatted_dealer_cards, formatted_player_cards
      deal_cards dealer_cards, player_cards
    elsif user_input == "s"
      formatted_player_cards = format_cards player_cards
      player_score = count_score player_cards
      dealer_score = count_score dealer_cards
      print_cards formatted_dealer_cards, formatted_player_cards
      print_scores dealer_score.to_s, player_score.to_s
    else
      puts "Please give a valid input"
      deal_cards dealer_cards, player_cards
    end
  end

  def game
    cards = deal_two
    formatted_player_cards = format_cards cards[:player_cards]
    formatted_dealer_cards = format_cards cards[:dealer_cards]
    print_cards formatted_dealer_cards, formatted_player_cards
    deal_cards cards[:dealer_cards], cards[:player_cards]
  end

  game
end
