require 'spec_helper'

RSpec.describe Round do
  it 'exists and has a deck' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    expect(round).to be_a Round
    expect(round.deck).to eq(deck)
  end

  it 'has turns and counts turns' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    expect(round.turns).to eq([])
    expect(round.turn_count).to eq(1)

    round.take_turn('Juneau')

    expect(round.turn_count).to eq(2)
  end

  it 'returns the current card' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card1)
  end

  it 'can return array of correct turns' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    turn_1 = round.take_turn('Juneau')
    turn_2 = round.take_turn('Juneau')

    expect(round.correct).to eq([turn_1])
  end

  it 'returns the current card' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    new_turn = round.take_turn('Juneau')

    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to eq(true)
    expect(round.turns).to eq([new_turn])
  end

  it 'counts correct cards' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    round.take_turn('Juneau')

    expect(round.number_correct).to eq(1)
    expect(round.current_card).to eq(card2)

    round.take_turn('Venus')

    expect(round.turns.count).to eq(2)
    expect(round.turns.last.feedback).to eq('Incorrect.')
    expect(round.number_correct).to eq(1)
  end

  it 'counts correct cards by category' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')

    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'calcs percentage of correct cards by category' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')

    expect(round.percent_correct).to eq(50.0)
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(round.current_card).to eq(card3)
  end
end
