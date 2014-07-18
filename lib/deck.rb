require_relative 'card.rb'

class Deck
  attr_accessor :cards

  def initialize
    @cards = generate_cards
  end

  def generate_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end

    cards
  end

  def shuffle_cards
    @cards.shuffle!
  end

end