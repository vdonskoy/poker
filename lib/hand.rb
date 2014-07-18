require "deck"

class Hand

  def initialize(deck)
    @deck = deck
    @cards = grab_cards
    @rank = nil
    get_values_array
  end

  def grab_cards
    cards = []
    5.times do
      cards << @deck.shift
    end
    cards
  end


  VALUES = [
    :deuce,
    :three,
    :four,
    :five,
    :six,
    :seven,
    :eight,
    :nine,
    :ten,
    :jack,
    :queen,
    :king,
    :ace
  ]

  def high_card
    highest_value = 0
    highest_card = nil
    @cards.each do |card|
      if VALUES.index(card.value) > highest_value
        highest_value = VALUES.index(card.value)
        highest_card = card
      end
    end

    @rank = 1
    highest_card.value
  end

  def two_pair
    pairs = []
    @values.each do |value|
      if @values.count(value) == 2
        pairs << value
      end
    end

    pairs.uniq!
  end

  def pair
    @values.each do |value|
      if @values.count(value) == 2
        pair_value = value
        return pair_value
      end
    end

    nil
  end

  # def repeats
  #   repeats = []
  #   @cards.each_with_index do |card, i|
  #     repeats = [card] unless repeats.count > 1
  #     (i+1...cards.count).each do |j|
  #       if card.value == @cards[j].value
  #         repeats << @cards[j]
  #       end
  #     end
  #   end
  #
  #   if pairs > 1
  #     @rank = 3
  #   elsif pairs == 1
  #     @rank = 2
  #   end
  #
  # end

  def get_values_array
    values = []
    @cards.each do |card|
      values << card.value
    end

    @values = values.sort!
  end

  def get_value_indexes
    values = []
    @values.each do |value|
      values << VALUES.index(card.value)
    end
    values
  end

  def three_of_a_kind
    # trips = []
    # @cards.each_with_index do |card, i|
    #   (i+1...cards.count).each do |j|
    #     if card.value == @cards[j].value
    #       pair += [card, @cards[j]]
    #     end
    #   end
    # end

    @values.each do |value|
      if @values.count(value) == 3
        trips_value = value
        return trips_value
      end
    end

    nil
  end

  def straight
    indexes = get_value_indexes
    indexes.each_index do |i|
      next if i == index.length - 1
      return false if (indexes[i] - indexes[i+1]).abs != 1
    end

    true
  end
end