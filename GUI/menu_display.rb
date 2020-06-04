
require 'fox16'

include Fox
#require 'SET-Play-Now.png'


#require './SET-Play-Now.png'
class GameMenu < FXMainWindow
  #def load_image(path)
  #File.open(path, "rb") do |io|

  #end
  #end
  def initialize app
    super app, "Game of Set", :width => 400, :height => 300
    hFrame1 = FXHorizontalFrame.new self
    hFrame2 = FXHorizontalFrame.new self
    chrLabel1 = FXLabel.new hFrame1, "Welcome to Game of Set "
    chrLabel2 = FXLabel.new hFrame2, "Enter # of Players: "
    chrTextField = FXTextField.new hFrame2, 2
    #vFrame1 = FXVerticalFrame.new(self, :opts => LAYOUT_FILL)
    hFrame3 = FXHorizontalFrame.new self
    hFrame4 = FXHorizontalFrame.new self
    hFrame5 = FXHorizontalFrame.new self
    playButton =  FXButton.new hFrame3, "Play Now", :width => 30, :height => 20
    aiButton = FXButton.new hFrame4, "Or Play with AI", :width => 30, :height => 20
    quitButton = FXButton.new hFrame5, "quit"

    quitButton.connect(SEL_COMMAND) do
      exit(0)
    end
    playButton.connect(SEL_COMMAND) do
      person_arr = []
      num_players = chrTextField.text.to_i
      pre_game_selection(person_arr, num_players)
      player_input(num_players, person_arr)
      puts '#############################################'
      puts 'Out of time! End of round'
      puts '#############################################'
      display_sorted_score(num_players, person_arr)

# Edited 05/25/20 by Kevin: replaced While true with loop do
      loop do
        sel = game_menu
        selection(sel, num_players, person_arr)
      end

    end

  end
  def create
    super
    show (PLACEMENT_SCREEN)
  end
end
