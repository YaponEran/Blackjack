class Player
  attr_reader :name, :currency, :type, :cards
  def initiazlize(name, type)
    @name = name
    @type = type
    @cards = Hand.new.cards
    @money_in_bank = 100
  end

  def bet_monet(amount)
    return if @money_in_bank < amount
    @money_in_bank -= amount
  end
end