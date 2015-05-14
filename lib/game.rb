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
    # user input
    puts("******************************************")
    puts("************* welcome to... **************")
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
    #display current hand
    for i in 0..1
      @player.hand.cards << @dealer.deal
      @dealer.hand.cards << @dealer.deal
    end

    display_current_hands

    loop do
      if @player.hand.total >= 21; break end
        puts("Hit (h) or Stay (s)?#{@prompt}")
        action = gets.chomp.downcase
      case action
      when "h"
        @player.hand.cards << @dealer.deal
      when "s"
        break
      else
        puts "l2type"
      end
      system("clear")
      display_current_hands
    end

    evaluate_hand
    # announce_winner
    # game_over
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

  def display_current_hands
    print @dealer.name
    @dealer.hand.display_cards

    puts("******************************************")

    print @player.name
    @player.hand.display_cards
  end
      # system('clear')
      # player_one_card = @player_one.draw
      # player_two_card = @player_two.draw

      # puts "Player one: #{@player_one.score}"
      # puts "Player two: #{@player_two.score}"
      # puts @player_one.name, player_one_card.display
      # puts @player_two.name, player_two_card.display

      # evaluate_hand(player_one_card, player_two_card)

      # print "Enter to Play Card"
      # gets


      # announce_winner
      # game_over

  # def evaluate_hand(first_card, second_card)
  #   #if value is greater, that card wins.
  #   #if there is a tie second player wins, lol
  #   if first_card.value > second_card.value
  #     puts "first card wins"
  #     @player_one.score += 1
  #   else
  #     puts "second card wins"
  #     @player_two.score += 1
  #   end
  # end

  # def announce_winner
  #   if @player_one.score >= @player_two.score
  #     puts "Player one wins with #{@player_one.score}!!"
  #   else
  #     puts "Player two wins with #{@player_two.score}!!"
  #   end
  # end

  # def game_over
  #   puts "Thanks for playing"
  #   print "Would you like to play again? (y/n) > "
  #   response = gets.chomp
  #   if response == 'y'
  #     @player_one.deck = Deck.new
  #     @player_two.deck = Deck.new
  #     @player_one.score = 0
  #     @player_two.score = 0
  #     start
  #   else
  #     exit
  #   end
  # end
end


# # variables
# prompt = " >"
# # user input
# puts("*****************************************")
# puts("************* welcome to... *************")
# puts("*****************************************")
# puts("********* NORMAL MODE BLACKJACK *********")
# puts("*****************************************")
# puts("************* by Reid Paape *************")
# puts("*****************************************")
# ascii_diamond = \
# """
#    *
#   ***
#  *****
# *******
#  *****
#   ***
#    *
# """
# ascii_spade = \
# """
#    *
#   ***
#  *****
# *******
#   * *
#    *
#   ***
# """
# ascii_heart = \
# """

#  ** **
# *******
#  *****
#   ***
#    *

# """
# ascii_club = \
# """
#    *
#   ***
#    *
#  *   *
# *** ***
#  *   *
#    *
# """

# puts("Hit (H) or Stay (S)?#{prompt}")
# action = gets.chomp.upcase
