require 'spec_helper'
require 'blackjack/entities/card.rb'

describe Card do
  it 'requires rank and suit' do
    expect { Card.new }.to raise_error(ArgumentError)
  end

  it 'should give score when given rank and suit'
    card = Card.new('Q', 'H')
    expect(card).to respond_to(:score)
    expect(card.score).to eq([10])
  end
  
end