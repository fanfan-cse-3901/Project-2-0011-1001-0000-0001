# frozen_string_literal: true

# File created 05/25/2020 by Yifan Yao
load 'player_input.rb'

# Created 05/25/2020 by Amanda Cheng
# Edited 05/26/2020 by Yifan Yao: refactor codes, remove global variables by steps
# Initialize array of players. Assume at least 2 players.
def create_array(num_players, person_arr)
  (0...num_players).each do |n|
    person_arr[n] = Player.new(n + 1)
  end

  person_arr
end

# Created 05/26/2020 by Yifan Yao
# Display sorted score
def display_sorted_score(num_players, person_arr)
  player_summary = {}
  (0...num_players).each do |n|
    player_summary.store(person_arr[n].player_num, person_arr[n].score)
  end

  player_summary = player_summary.sort_by { |_k, v| -v }.to_h

  player_summary.each do |i|
    puts "Player #{i[0]}: #{i[1]}"
  end
end

# Created 05/25/2020 by Amanda Cheng
# Initialize array of players. Assume at least 2
def pre_game_selection(person_arr)
  print 'Enter number of players (at least 2): '
  num_players = gets.chomp.to_i
  while num_players < 2
    print 'Invalid number, try again: '
    num_players = gets.chomp.to_i
  end
  create_array(num_players, person_arr)

  num_players
end

# Created 05/26/2020 by Yifan Yao
def selection(sel)
  if sel == 1

  elsif sel == 2
    person_arr = []
    num_players = pre_game_selection(person_arr)
    player_input(num_players, person_arr)
    puts 'End of round'
    display_sorted_score(num_players, person_arr)
  elsif sel == 3
    exit
  end
end

def game_menu
  sel = -1
  until sel.positive? && sel < 4
    print '[1]: New round, [2]: New game, [3]: Quit: '
    sel = gets.to_i
  end

  sel
end

sel = 2
while true
  selection(sel)
  sel = game_menu
end