require_relative "card"
class CardBoard
  SUITS = %w(♠ ♣ ♥ ♦)
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_reader :cards
  def initialize
    @cards = SUITS.flat_map do |suit|
      VALUES.map{|value| Card.new(suit, value)}
    end
  end
end