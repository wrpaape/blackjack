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
    @dealer.name = "The Dealer"
    @player.hand = Hand.new
    @dealer.hand = Hand.new
  end


  def start

    for i in 0..1
      @player.hand.cards << @dealer.deal
      @dealer.hand.cards << @dealer.deal
    end


    player_action
    dealer_action
    evaluate_hand
  end

  def evaluate_hand
    @player_total = @player.hand.total
    @dealer_total = @dealer.hand.total
    if @player_total > 21
      puts "#{@player.name} bust"
      puts "#{@dealer.name} win"
    elsif @dealer_total > 21
      puts "#{@dealer.name} bust"
      puts "#{@player.name} win"
    elsif @player_total < @dealer_total
      puts "#{@player.name} under"
      puts "#{@dealer.name} win"
    elsif @player_total == @dealer_total
      puts "push"
      puts "#{@player.name} and #{@dealer.name} tie"
    elsif @player_total == 21
      puts "blackjack!"
      puts "#{@player.name} win"
    else
      puts "#{@dealer.name} under"
      puts "#{@player.name} win"
    end
  end

  def player_action
    loop do
      display_header
      display_current_hands
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
      if @dealer.hand.total >= 17; break end
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
end
