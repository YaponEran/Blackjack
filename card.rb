class Card
  CARD_VALUE = {J: 10, Q: 10, K: 10, A: 11}
  SUITS = %w(♠ ♣ ♥ ♦)
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_reader :type, :values, :points
  def initialize(type, value)
    @type = type
    @values = value
    @points = assign_card_points
  end

  def assign_card_points
    cost = CARD_VALUE.fetch(@values.to_sym, @values.to_i)
  end
end
