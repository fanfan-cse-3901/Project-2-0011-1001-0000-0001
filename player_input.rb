# frozen_string_literal: true

# File created 05/25/2020 by Amanda Cheng
class Player
  attr_accessor :player_num, :score

  # Created 05/25/2020 by Amanda Cheng
  # Edited 05/26/2020 by Yifan Yao: set score to 0 by default
  # initialize class player with the default values
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

# Created 05/26/2020 by Yifan Yao
def create_array(num_players, person_arr)
  i = 1
  while i <= num_players
    person_arr[i - 1] = Player.new(i)
    i += 1
  end
  person_arr
end

# Created 05/25/2020 by Amanda Cheng
# Edited 05/26/2020 by Yifan Yao: refactor codes, remove global variables by steps
def player_input(num_players)
  person_arr = []
  create_array(num_players, person_arr)

  # i is for debugging purposes will remove later
  i = 0
  # this checks when deck is empty and no set from table
  continue_game = true

  # continue playing for the round until end game
  while continue_game && (i < 5) # i < 5 is to terminate game at some point for debugging purposes

    print 'Input number of player who yells SET first: '
    num = gets.to_i
    # Check if player inputted valid number
    while (num > num_players) || (num <= 0)
      puts 'Invalid player number. Try again'
      print 'Input number of player who yells SET first: '
      num = gets.to_i
    end

    # num_cards_table = $Table.length  # Know # of cards on table
    num_cards_table = 12 # debug purpose say is 12 for now
    puts "Player #{num}: Pick a set of 3 cards. Type the card # between #{1..num_cards_table}"

    # Now obtain the 3 cards and match it with the cards on Table
    print 'Card 1: '
    card1 = gets.to_i
    while (card1 > num_cards_table) || (card1 <= 0) # Check to make sure card is available
      print 'Card not on Table. Try again: '
      card1 = gets.to_i
    end

    print 'Card 2: '
    card2 = gets.to_i
    while (card2 > num_cards_table) || (card2 <= 0) || (card2 == card1)
      print 'Card not valid. Try again: '
      card2 = gets.to_i
    end

    print 'Card 3: '
    card3 = gets.to_i
    while (card3 > num_cards_table) || (card3 <= 0) || (card3 == card1) || (card3 == card2)
      print 'Card not valid. Try again: '
      card3 = gets.to_i
    end
    # c1 = table[card1.to_i]

    # call check set Kevin's method here by sending in c1,c2,c3
    is_set = false # set false for now for testing purposes

    if is_set
      # If is set, remove from table array
      $Table.delete_at(c1)
      $Table.delete_at(c2)
      $Table.delete_at(c3)
      # call set_table method from Prachiti to replace cards --YET TO BE WRITTEN
      #
      # output that it is a set and update score
      puts 'It is a set!'

      person_arr[num - 1].win_pts
      # Call method which tests if end of game (deck empty and no set on table) --NOT YET IMPLEMENTED
      # NOT YET IMPLEMENTED
      # continue_game = -----
    else
      # if not a set, output that it is not a set and update score
      puts 'Not a set! '
      person_arr[num - 1].lose_pts
    end
    puts "Player #{num}'s Score: #{person_arr[num - 1].current_pts}" # outputs the player's score

    # testing purposes can ignore
    i += 1
  end
end

# Created 05/25/2020 by Amanda Cheng
# Edited 05/26/2020 by Yifan Yao: refactor codes, remove global variables by steps
# Initialize array of players. Assume at least 2 players.
num_players = -1
while num_players <= 2
  print 'Enter number of players (at least two players): '
  num_players = gets.to_i
end

player_input(num_players)
