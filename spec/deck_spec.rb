require 'rspec'
require 'deck'

describe "deck" do
  subject { Deck.new }

  it "shuffles" do
    old_cards = subject.cards.dup
    new_cards = subject.shuffle_cards
    expect(new_cards == old_cards).to be false
  end
end