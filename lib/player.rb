class Player
  attr_accessor :name, :hand

  def initialize
    @hand = Hand.new
  end

  def hit
  end

  def stay
  end

end
