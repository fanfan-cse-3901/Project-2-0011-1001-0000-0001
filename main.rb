# frozen_string_literal: true

# File created 05/25/2020 by Yifan Yao
=begin
main.rb starts the game with game menu selections and asks users for basic infor such as number of players,
whether they want new game, quit, or new round after their current game.
=end
load 'player_input.rb'
require 'timeout'
# Created 05/25/2020 by Amanda Cheng
# Edited 05/26/2020 by Yifan Yao: refactor codes, remove global variables by steps
# Edited 05/27/2020 by Kevin Dong: added documentation
# Edited 05/26/2020 by Yifan Yao: interaction with player_input.rb
# Public: Initialize array of players. Assume at least 2 players.
#
# num_players - Integer for number of players active.
# person_arr - Array of Player objects to be populated.
#
# Returns the populated array, person_arr.
def create_array(num_players, person_arr)
  (0...num_players).each do |n|
    person_arr[n] = Player.new(n + 1)
  end
  person_arr[1] = CPU.new(2) if num_players == 1
  person_arr
end

# Created 05/26/2020 by Yifan Yao
# Edited 05/27/2020 by Kevin Dong: Added Documentation
# Edited 05/31/2020 by Amanda Cheng: Displayed Winner
# Outputs the score via console.
def display_sorted_score(num_players, person_arr)
  player_summary = {}
  (0...num_players).each do |n|
    player_summary.store person_arr[n].player_num, person_arr[n].score
  end
  player_summary.store person_arr[1].cpu_num, person_arr[1].score if num_players == 1
  player_summary = player_summary.sort_by { |_k, v| -v }.to_h
  puts 'Leaderboard'
  player_summary.each do |i|
    puts "Player #{i[0]} Score: #{i[1]}"
  end
end

# Created 05/25/2020 by Amanda Cheng
# Edited 05/27/2020 by Kevin Dong: Added Documentation
# Edited 06/03/2020 by Amanda Cheng: Rechanged the function
# Edited 06/04/2020 by Kevin Dong: Added cpu_input support
# Public: Initialize array of players. Assume at least 2
#
# person_arr - Array of Player objects to be populated.
# num_players - Variable that holds integer value of players.
#
# Returns number of players.
def pre_game_selection person_arr, num_players
  # print 'Enter number of players (at least 2): '
  # $num_players = gets.chomp.to_i
  while num_players < 1
    print 'Invalid number, try again: '
    num_players = gets.chomp.to_i
  end
  create_array num_players, person_arr

  num_players
end

# Created 05/26/2020 by Yifan Yao
# Edited 05/27/2020 by Kevin Dong: Added Documentation
# Edited 06/04/2020 by Kevin Dong: Added cpu_input support
# Public: Handles player selection, round control, and score.
#
# sel - Integer that reflects game-state.
#
# Returns nothing.
def selection (sel, num_players, person_arr)
  if sel == 1 || sel == 2
    cpu_input(num_players, person_arr) if num_players == 1
    player_input(num_players, person_arr) if num_players > 1
    puts ' '
    puts '#############################################'
    puts 'Out of time! End of round'
    puts '#############################################'
    display_sorted_score num_players, person_arr
  elsif sel == 3
    exit 0
  end
end

# Created 05/25/2020 by Yifan Yao
# Edited 05/27/2020 by Kevin Dong: Added Documentation
# Public: Handles end of round/game scenario.
#
# Returns nothing.
def game_menu
  sel = -1
  until sel.positive? && sel < 4
    print '[1]: New round [2]: New game, [3]: Quit: ' # [1]: New round does not work with num_players
    sel = gets.to_i
  end

  sel
end

# Created 05/25/2020 by Yifan Yao
# Edited 06/04/2020 by Kevin Dong: Added cpu_input support
person_arr = []
print 'Enter number of players (1 for vs computer player): '
num_players = gets.chomp.to_i
pre_game_selection person_arr, num_players
puts 'Computer player has entered as player 2.' if num_players == 1

cpu_input num_players, person_arr if num_players == 1
player_input num_players, person_arr if num_players > 1
puts ' '
puts '#############################################'
puts 'Out of time! End of round'
puts '#############################################'
display_sorted_score num_players, person_arr

# Created 05/25/2020 by Yifan Yao
# Edited 05/25/20 by Kevin: replaced While true with loop do
loop do
  sel = game_menu
  if sel == 2
    person_arr = []
    print 'Enter number of players (1 for VS computer player): '
    num_players = gets.chomp.to_i
    num_players = pre_game_selection(person_arr, num_players)
  end
  selection sel, num_players, person_arr
end
