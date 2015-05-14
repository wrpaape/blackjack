class Player
  attr_accessor :name, :hand

  def initialize
    @hand = Hand.new
  end

end
