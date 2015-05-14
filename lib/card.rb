class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def display
"""
 ----
| #{suit} |
| #{display_value} |
 ----
"""
  end

  def display_value
    case value
    when 10.1 then "J"
    when 10.2 then "Q"
    when 10.3 then "K"
    when 11 then "A"
    else
      value
    end
  end
end
