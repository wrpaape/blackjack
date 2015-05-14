class Hand
  attr_reader :cards

  def initialize
    @cards = Array.new
    @total = 0
  end

  def add_to_hand
    @hand_cards.push(Dealer.deal)
  end

  def total
    sum = 0
    for i in 0...@cards.size
      sum += @cards[i].value.round
    end
    @total = sum
  end

  def display_cards
    for i in 0...@cards.size
      @cards[i].display
    end
  end

end
