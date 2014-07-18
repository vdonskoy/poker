require 'rspec'
require 'hand'

describe "hand" do
  let (:full_house_deck) {[
                    Card.new(:hearts, :king), Card.new(:clubs, :king),
                    Card.new(:spades, :king), Card.new(:hearts, :ten),
                    Card.new(:clubs,:ten)
                    ]}
  let (:royal_flush_deck) {[
                     Card.new(:diamonds, :ace), Card.new(:diamonds, :king),
                     Card.new(:diamonds, :queen), Card.new(:diamonds, :jack),
                     Card.new(:diamonds, :ten)
                     ]}
  let (:first_hand) { Hand.new(full_house_deck) }
  let (:second_hand) { Hand.new(royal_flush_deck) }

  describe "#high_card" do
    it "gets the high card" do
      expect(first_hand.high_card).to eq(:king)
    end
  end

  describe "#pair" do
    it "checks for pair" do
      expect(first_hand.pair).to eq(:ten)
    end
  end

  describe "#three_of_a_kind" do
    it "checks for three of a kind" do
      expect(first_hand.three_of_a_kind).to eq(:king)
    end
  end

  describe "#two_pair" do
    it "checks for two-pair" do
      expect(first_hand.two_pair.length).to eq(1)
    end
  end


  describe "#replace" do

  end
end