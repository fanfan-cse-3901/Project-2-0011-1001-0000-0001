#Internal: Only used for creation of deck and referring to card attributes only for this project
#
#Examples
#
#     Card.new(1,1,1,1)
#     #=>card object with num=1 color=1 shade=1 shape=1
#
#num- number of shapes on a card
#
#shape- the way an object looks
#
#shade- how filled are the shapes
#
#color- the color of the shapes
class Card
  #Internal :Gets the number of a said attribute
  attr_accessor :num,:color,:shade,:shape
  #Internal: Initialize all attributes of card REQUIRED
  def initialize(num,color,shade,shape)
    @num=num
    @color=color
    @shade=shade
    @shape=shape
  end
end
#Example:
#
#        cardone()
#        #=>set of cards for set where order of change is (num,color,shape,shade) repsectively in that order
#
#Returns the Deck of Cards for set
def cardone()
  num_A=[1,2,3]#[1,2,3]
  color_A=[1,2,3]#["red","green","purple"] 
  shade_A=[1,2,3]#["solid","striped","open"]
  shape_A=[1,2,3]#["squiggle","diamond","oval"]
  cards = Array.new #to be returned
  n=0#num location
  #loops through all cards
  (0..80).each do |n|           
    #% based on when to adjust according to base-3
    cards[n]= Card.new(num_A[n%3],color_A[(n/3)%3],shade_A[(n/27)%3],shape_A[(n/9)%3])
  end   
  cards #returned element
end

