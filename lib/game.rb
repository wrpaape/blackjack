require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'player'
require_relative 'dealer'


class Game

  @prompt = " >"

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @dealer.deck = Deck.new
    @player.name = "You"
    @dealer.name = "The dealer"
    @player.hand = Hand.new
    @dealer.hand = Hand.new
  end


  def start

    for i in 0..1
      @player.hand.cards << @dealer.deal
      @dealer.hand.cards << @dealer.deal
    end

    if @player.hand.total== 21
      display_header
      display_current_hands
      puts "blackjack!"
      puts "#{@player.name} win"
    else
      player_action
      if @player.hand.total > 21
        puts "#{@player.name} bust"
        puts "#{@dealer.name} wins"
      else
        dealer_action
        evaluate_hand
      end
    end

    game_over

  end

  def evaluate_hand

    if @dealer.hand.total > 21
      puts "#{@dealer.name} busts"
      puts "#{@player.name} win"
    elsif @player.hand.total < @dealer.hand.total
      puts "#{@player.name} are under"
      puts "#{@dealer.name} wins"
    elsif @player.hand.total == @dealer.hand.total
      puts "push"
      puts "#{@player.name} and #{@dealer.name} tie"
    elsif @player.hand.total == 21
      puts "twenty-one!"
      puts "#{@player.name} win"
    else
      puts "#{@dealer.name} is under"
      puts "#{@player.name} win"
    end
  end

  def player_action
    loop do
      display_header
      display_current_hands_dealer_hidden
      if @player.hand.total >= 21; break end
        puts("\nHit (h) or Stay (s)?#{@prompt}")
        action = gets.chomp.downcase
      case action
      when "h"
        @player.hand.cards << @dealer.deal
      when "s"
        break
      else
        puts "l2type"
      end
    end
  end

  def dealer_action
    loop do
      display_header
      display_current_hands
      if @dealer.hand.total >= 16; break end
      @dealer.hand.cards << @dealer.deal
      sleep(1)
    end
  end

  def display_current_hands
    print @dealer.name
    @dealer.hand.display_cards

    puts("******************************************")

    print @player.name
    @player.hand.display_cards
  end

  def display_current_hands_dealer_hidden
    print @dealer.name
    print(
"""
                   ---
                  | X |
                  | # |
                   ---
""")
    @dealer.hand.cards[1].display

    puts("******************************************")

    print @player.name
    @player.hand.display_cards
  end

  def display_header
    system("clear")
    puts("******************************************")
    puts("************* Welcome to... **************")
    puts("******************************************")
    puts("********* NORMAL MODE BLACKJACK **********")
    puts("******************************************")
    puts("************* by Reid Paape **************")
    puts("******************************************")
    puts(
"""
    *          *                     *
   ***        ***       ** **       ***
  *****      *****     *******       *
 *******    *******     *****      *   *
  *****       * *        ***      *** ***
   ***         *          *        *   *
    *         ***                    *

"""
    )
  end

  def game_over
    puts("GAME OVER")
    puts("\nPlay Again (y/n)?#{@prompt}")
    again = gets.chomp.downcase
    case again
    when "y"
      initialize
      start
    when "n"
      puts "fine then"
    else
      puts "l2type"
      game_over
    end
  end
end
