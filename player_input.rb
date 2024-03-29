# frozen_string_literal: true

# File created 05/25/2020 by Amanda Cheng
=begin
player_input asks for user of difficulty level and times the game based on level.
It calls other methods that display the table the cards both on console and in a pop up window
and calls the method that tests if the 3 cards the user(s) selected is set and
adds or minus score to each player. It also holds the version for CPU player and the user.
=end
require './set_verify.rb'
require './table_setting_script.rb'
require './gen_table_img.rb'
require 'timeout'

# Created 05/25/2020 by Amanda Cheng
# Edited 05/29/2020 by Yifan Yao: remove debugging lines, interaction with main.rb
# Edited 06/01/2020 by Amanda Cheng: added timer functionality set by user
# Edited 06/05/2020 by Yifan Yao: Refactor codes
class Player
  attr_accessor :player_num, :score

  include SetVerify
  include TableSetting

  # Created 05/25/2020 by Amanda Cheng
  # Edited 05/26/2020 by Yifan Yao: set score to 0 by default
  # Initialize class player with the default values
  def initialize(player_num)
    @player_num = player_num
    @score = 0
  end

  # Created 05/26/2020 by Yifan Yao
  def win_pts
    self.score += 1
  end

  # Created 05/26/2020 by Yifan Yao
  def lose_pts
    self.score -= 1
  end

  # Created 05/26/2020 by Yifan Yao
  def current_pts
    self.score
  end

  attr_reader :player_num, :score
  public :initialize, :win_pts, :lose_pts, :current_pts
end

# Created 06/03/2020 by Kevin Dong
# This is the class that keeps track of the CPU player and its score.
# Similar to the player class
class CPU
  attr_accessor :cpu_num, :score

  include SetVerify
  include TableSetting

  def initialize(cpu_num)
    @cpu_num = cpu_num
    @score = 0
  end

  def win_pts
    self.score += 1
  end

  def lose_pts
    self.score -= 1
  end

  def current_pts
    self.score
  end

  attr_reader :cpu_num, :score
  public :initialize, :win_pts, :lose_pts, :current_pts
end

# Created 05/25/2020 by Amanda Cheng
# Edited 05/26/2020 by Yifan Yao: refactor codes, remove global variables by steps
# Edited 05/26/2020 by Yifan Yao: replace redundant codes by using a loop, change of implementation notified to all
# Edited on 06/03/2020 by Kevin Dong: Important implementation to enable functionality again after set_setup changes.
# Edited on 06/04/2020 by Amanda Cheng: Updated timer so that it automatically terminates code and does not need to wait for user to input anything
# Edited on 06/05/2020 by Prachiti Garge: Updated call to TableSetting.set_table.
# Edited on 06/06/2020 by Prachiti Garge: Deleted print Debugging statement in the final draft.
# Public: Process for multiplayer game
#
# num_players - should be number of players in game
# person_arr - person array at least 2
#
# Returns nothing.
def player_input(num_players, person_arr)
  table = []
  dealer = (0..80).to_a
  puts "NUMBER OF PLAYERS IS #{num_players}"
  mode = mode_level
  time = 100
  time = if mode == 'e'
           300
         elsif mode == 'm'
           150
         else
           30
         end

  # This checks when deck is empty and no set from table
  continue_game = true
  first_time = true
  # Begin the timer
  begin
    Timeout.timeout time do
      # Continue playing for the round until end game (when time is up)
      while continue_game
        # Only want output table once because calling set_table later on
        if first_time
          TableSetting.set_table table, dealer, mode
          first_time = false
        end
        print 'Input number of player who yells SET first: '
        num = gets.to_i
        # Check if player inputted valid number
        while num > num_players || num <= 0
          puts 'Invalid player number. Try again'
          print 'Input number of player who yells SET first: '
          num = gets.to_i
        end
        num_cards_table = table.length
        puts "Player #{num}: Pick a set of 3 cards. Type the card # between #{1..num_cards_table}"
        # Now obtain the 3 cards and match it with the cards on Table
        card = [-1, -2, -3]
        (1..3).each do |i|
          print "Card #{i}: "
          card[i - 1] = gets.to_i - 1
          while card[i - 1] >= num_cards_table || card[i - 1].negative? || card[2] == card[0] || card[2] == card[1]
            print 'Card not valid. Try again: '
            card[i - 1] = gets.to_i - 1
          end
        end
        # Check if the three cards are a set
        if SetVerify.is_set? [table[card[0]], table[card[1]], table[card[2]]]
          # Output that it is a set and update score
          puts 'It is a set!'
          person_arr[num - 1].win_pts
          puts "Player #{num}'s Score: #{person_arr[num - 1].current_pts}" # Outputs the player's score
          card_sort = card.sort
          # If is set, remove from table array
          table.delete_at card_sort[0]
          table.delete_at card_sort[1] - 1
          table.delete_at card_sort[2] - 2
          # Call set_table method from Prachiti to replace cards
          TableSetting.set_table table, dealer, mode
          # Call method which tests if end of game (deck empty and no set on table)
          continue_game = false if dealer.empty? && !TableSetting.at_least_one_set?(table)
        else
          # If not a set, output that it is not a set and update score
          puts 'Not a set!'
          person_arr[num - 1].lose_pts
          puts "Player #{num}'s Score: #{person_arr[num - 1].current_pts}" # Outputs the player's score
          puts ''
        end
      end
    end
  rescue Timeout::Error
  end
  end

# Created 06/04/2020 by Kevin Dong
# Edited 06/04/2020 by Troy Stein: Actual Functionality
# Edited on 06/05/2020 by Prachiti Garge: Updated call to TableSetting.set_table.
# Edited 06/04/2020 by Troy Stein: Implemented the CPU part into the method
# Edited 06/06/2020 by Amanda Cheng, Kevin Dong, Troy Stein: Turn based implementation
# Public: Process for 1 v 1 game
#
# num_players - should be 1 for 1 player
# person_arr - person array
#
# Returns nothing.
def cpu_input(_num_players, person_arr)
  table = []
  dealer = (0..80).to_a

  # Ask user for mode level to determine round time
  mode = mode_level
  time = 100
  turn = 20
  if mode == 'e'
    time = 300
    turn = 60
  elsif mode == 'm'
    time = 150
    turn = 30
  else
    time = 60
    turn = 15
   end

  # This checks when deck is empty and no set from table
  continue_game = true
  first_time = true
  # Notify the user that time has occurred
  puts "#{time} seconds start now"
  begin
    Timeout.timeout time do
      # Continue playing for the round until end game (when time is up)
      while continue_game
        # Only want output table once because calling set_table later on
        if first_time

          TableSetting.set_table table, dealer, mode
          first_time = false

        end
        begin
          Timeout.timeout turn do
          num_cards_table = table.length
            puts "Player: Pick a set of 3 cards. Type the card # between #{1..num_cards_table}"
            # Now obtain the 3 cards and match it with the cards on Table
            card = [-1, -2, -3]
            (1..3).each do |i|
              print "Card #{i}: "
              card[i - 1] = gets.to_i - 1
              while card[i - 1] >= num_cards_table || card[i - 1].negative? || card[2] == card[0] || card[2] == card[1]
                print 'Card not valid. Try again: '
                card[i - 1] = gets.to_i - 1
              end
            end

            # Decision Verification
            if SetVerify.is_set? [table[card[0]], table[card[1]], table[card[2]]]
              # Output that it is a set and update score
              puts 'It is a set!'
              person_arr[0].win_pts
              puts "Your Score: #{person_arr[0].current_pts}" # Outputs the player's score
              card_sort = card.sort
              # If is set, remove from table array
              table.delete_at card_sort[0]
              table.delete_at card_sort[1] - 1
              table.delete_at card_sort[2] - 2

              # Call set_table method from Prachiti to replace cards
              TableSetting.set_table table, dealer, mode

              # Call method which tests if end of game (deck empty and no set on table)
              continue_game = false if dealer.empty? && !TableSetting.at_least_one_set?(table)
              break
            else
              # If not a set, output that it is not a set and update score
              puts 'Not a set!'
              person_arr[0].lose_pts
              puts "Your Score: #{person_arr[0].current_pts}" # Outputs the player's score
            end
          end
        rescue Timeout::Error
          sets = SetVerify.find_set table
          table.delete sets[0][0]
          table.delete sets[0][1]
          table.delete sets[0][2]
          puts
          TableSetting.set_table table, dealer, mode
          person_arr[1].win_pts
          puts "CPU's Score: #{person_arr[1].current_pts}" # Outputs the player's score
          puts ''
        end
      end
    end
  rescue Timeout::Error
    puts 'TIMEOUT'
  end
end

# Created 06/04/2020 by Amanda Cheng:
# Edited 06/05/2020 by Yifan Yao: Change `puts` to `print` to avoid extra escape sequences
# Public: Asks player to input mode level to determine time for round and types of hints.
#
# Returns Mode.
def mode_level
  puts 'Model level: '
  puts '[e]asy: time is 300 sec, helpful hints'
  puts '[m]edium: time is 150 sec, useful hints'
  puts '[h]ard: time is 60 sec, simple hints'
  print 'Mode Level? (e/m/h): '
  mode = gets.chomp!
  valid_mode = false
  until valid_mode
    if mode == 'e' || mode == 'm' || mode == 'h'
      valid_mode = true
    else
      print 'Not valid mode! Try again: '
      mode = gets.chomp!
    end
  end
  mode
end
