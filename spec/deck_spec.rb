require 'spec_helper'

RSpec.describe Deck do
  it 'exists and has cards' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck).to be_a Deck
    expect(deck.cards).to eq([card1, card2, card3])
  end

  it 'counts cards' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.count).to eq(3)
  end

  it 'returns cards based on category' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.cards_in_category(:STEM)).to eq([card2, card3])
    expect(deck.cards_in_category(:Geography)).to eq([card1])
    expect(deck.cards_in_category('Pop Culture')).to eq([])
  end
end
