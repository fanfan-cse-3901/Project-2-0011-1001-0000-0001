# frozen_string_literal: true

# File created 05/25/2020 by Amanda Cheng
require './set_verify.rb'
require './table_setting_script.rb'
require 'timeout'

# Created 05/25/2020 by Amanda Cheng
# Edited 05/29/2020 by Yifan Yao: remove debugging lines, interaction with main.rb
# Edited 06/01/2020 by Amanda Cheng: added timer functionality set by user
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

# Created 05/25/2020 by Amanda Cheng
# Edited 05/26/2020 by Yifan Yao: refactor codes, remove global variables by steps
# Edited 05/26/2020 by Yifan Yao: replace redundant codes by using a loop, change of implementation notified to all
# on 05/26/2020
def player_input(num_players, person_arr)
  print "Do you want to set Game Round time? (y/n) "
  ans = gets.chomp
  if ans == 'y'
    print "Set Min Game Round Time (sec): "
    time = gets.to_i
    elsif ans == "n"
    time = 1<<64 #Maximum bigNum
  end

    #time consuming operation
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    elapse = end_time - start_time



  # This checks when deck is empty and no set from table
  continue_game = true
  first_time = true

  # Continue playing for the round until end game (when time is up)
    while continue_game && elapse < time
    #loop do

      puts ""
      puts "TIME IS #{time} seconds"
    # Only want output table once because calling set_table later on
    if first_time
      TableSetting.set_table($table, $dealer)
      first_time = false

    end
      end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      elapse = end_time - start_time
      break if elapse > time
    print 'Input number of player who yells SET first: '
    num = gets.to_i
    # Check if player inputted valid number
    while (num > num_players) || (num <= 0)
      puts 'Invalid player number. Try again'
      end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      elapse = end_time - start_time
      break if elapse > time
      print 'Input number of player who yells SET first: '

      num = gets.to_i
      end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      elapse = end_time - start_time
      break if elapse > time
    end
      end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      elapse = end_time - start_time
      break if elapse > time
    # num_cards_table = $Table.length  # Know # of cards on table
    num_cards_table = $table.length # Debug purpose say is 12 for now
    puts "Player #{num}: Pick a set of 3 cards. Type the card # between #{1..num_cards_table}"
    #status = Timeout::timeout(10, message = "out of time!"){
      # Now obtain the 3 cards and match it with the cards on Table
      card = [-1, -2, -3]
      (1..3).each { |i|
        #check time
        end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        elapse = end_time - start_time
        break if elapse > time
        print "Card #{i}: "
        card[i - 1] = gets.to_i - 1
        while (card[i - 1] >= num_cards_table) || (card[i - 1] < 0) || (card[2] == card[0]) || (card[2] == card[1])
          print 'Card not valid. Try again: '
          #check time
          end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
          elapse = end_time - start_time
          break if elapse > time
          card[i - 1] = gets.to_i - 1
        end
      }
      ## }


    #set_vert = SetG.new
    # c1 = table[card1.to_i]
    # check time
      end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      elapse = end_time - start_time
      break if elapse > time
    if SetVerify.is_set?(card)
      # Output that it is a set and update score
      puts 'It is a set!'
      person_arr[num - 1].win_pts
      puts "Player #{num}'s Score: #{person_arr[num - 1].current_pts}" # Outputs the player's score
      card_sort = card.sort
      # If is set, remove from table array
      $table.delete_at(card_sort[0])
      $table.delete_at(card_sort[1] - 1)
      $table.delete_at(card_sort[2] - 2)

      # Call set_table method from Prachiti to replace cards
      TableSetting.set_table($table, $dealer)

      # Call method which tests if end of game (deck empty and no set on table)
      if $dealer.empty? && !TableSetting.at_least_one_set($table)
        continue_game = false
      end
    else
      # If not a set, output that it is not a set and update score
      puts 'Not a set! '
      person_arr[num - 1].lose_pts
      puts "Player #{num}'s Score: #{person_arr[num - 1].current_pts}" # Outputs the player's score
      puts ''

    end
    #check time
      end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      elapse = end_time - start_time
    end
end
