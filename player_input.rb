#Class Player
class Player

  attr_accessor :player_num, :score

  #initialize class player with the default values
  def initialize(player_num, score)
    @player_num = player_num
    @score = score
  end
  def player_num
    @player_num
  end
  def score
    @score
  end
end
###############################END OF CLASS PLAYER##########################################

def player_input(num_players)
  #i is for debugging purposes will remove later
  i = 0
  #this checks when deck is empty and no set from table
  continue_game = true


#continue playing for the round until end game
  while continue_game and i <5 #i <5 is to terminate game at some point for debugging purposes

    puts "Input number of player who yells SET first: "
    num = gets.to_i
    #Check if player inputted valid number
    while num > num_players or num <= 0
      puts "Invalid player number. Try again"
      puts "Input number of player who yells SET first: "
      num = gets.to_i
    end

      #num_cards_table = $Table.length  #Know # of cards on table
      num_cards_table = 12 #debug purpose say is 12 for now
      puts "Player #{num}: Pick a set of 3 cards. Type the card # between #{1..num_cards_table}"


      #Now obtain the 3 cards and match it with the cards on Table
      puts "Card 1: "
      card1 = gets.to_i
      while card1 > num_cards_table or card1 <= 0 #Check to make sure card is available
        puts "Card not on Table. Try again"
        card1 = gets.to_i
      end

      puts "Card 2: "
      card2 = gets.to_i
      while card2 > num_cards_table or card2 <= 0 or card2 == card1
        puts "Card not valid. Try again"
        card2 = gets.to_i
      end

      puts "Card 3: "
      card3 = gets.to_i
      while card3 > num_cards_table or card3 <= 0 or card3 == card1 or card3 == card2
        puts "Card not valid. Try again"
        card3 = gets.to_i
      end
      #c1 = table[card1.to_i]

      #call check set Kevin's method here by sending in c1,c2,c3
      is_set = false #set false for now for testing purposes

      if is_set
        #If is set, remove from table array
        $Table.delete_at(c1)
        $Table.delete_at(c2)
        $Table.delete_at(c3)
        #call set_table method from Prachiti to replace cards --YET TO BE WRITTEN
        #
        #output that it is a set and update score
        puts "It is a set!"

        $person_arr[num-1].score +=1
        puts "Player #{num}'s Score: #{$person_arr[num-1].score}"  #outputs the player's score
        #Call method which tests if end of game (deck empty and no set on table) --NOT YET IMPLEMENTED
        #NOT YET IMPLEMENTED#
        # continue_game = -----
      else
        #if not a set, output that it is not a set and update score
        puts "Not a set! "
        $person_arr[num-1].score -=1
        puts "Player #{num}'s Score: #{$person_arr[num-1].score}"  #outputs the player's score
      end

    puts " "

    #testing purposes can ignore
    i +=1
  end

end

#Initialize array of players. Assume at least 2
puts "Enter number of Players: "
num_players = gets.to_i
#num_players = 3 #For testing purposes say num_players is 3
i=1
#create global array of players objects with default attributes
$person_arr = Array.new num_players
while i <= num_players
  $person_arr[i-1] = Player.new(i,0)
  i+=1
end
player_input(num_players)
