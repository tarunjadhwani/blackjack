require 'spec_helper'
require 'blackjack/entities/blackjacker.rb'

describe Blackjacker do
  it 'should initially start with empty cards' do
    blackjacker = Blackjacker.new
    expect(blackjacker.cards).to eq([])
  end

  it 'should give the right score' do 
    blackjacker = Blackjacker.new
    expect(blackjacker.score).to eq(0)
  end
end