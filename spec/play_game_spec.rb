require 'spec_helper'

RSpec.describe PlayGame do
  it 'exists' do
    play = PlayGame.new

    expect(play).to be_a PlayGame
  end
end
