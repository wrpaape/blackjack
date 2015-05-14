class Dealer
  attr_accessor :deck, :name, :hand

  def initialize
    @deck = Deck.new
    @hand = Hand.new
  end

  def deal
    @deck.draw
  end

end
