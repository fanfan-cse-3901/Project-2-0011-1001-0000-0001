# frozen_string_literal: true

# File created 05/24/2020 by Troy Stein
# Edited 05/27/2020 by Kevin Dong: Documentation and Style Formatting
# Edited 06/01/2020 by Troy Stein: Revised Deck generation method to avoid global variables
# Edited 06/03/2020 by Kevin Dong: Re-added documentation and re-implemented dealer functionality
=begin

=end
# Internal: Only used for creation of deck and referring to card attributes only for this project
#
# Examples
#
#     Card.new(1,1,1,1)
#     #=>card object with num=1 color=1 shade=1 shape=1
#
# num - number of shapes on a card
#       [1, 2, 3]
#
# shape - the way an object looks
#         ['red', 'green', 'purple']
#
# shade - how filled are the shapes
#         ['solid', 'striped', 'open']
#
# color - the color of the shapes
#         ['squiggle', "diamond', 'oval']
class Card
  # Internal :Gets the number of a said attribute
  attr_accessor :num, :color, :shade, :shape
  # Internal: Initialize all attributes of card REQUIRED
  def initialize(num, color, shade, shape)
    @num = num
    @color = color
    @shade = shade
    @shape = shape
  end
end
# Public: Creates Deck for use in other methods
#
# Example:
#
#        cardone()
#        #=>set of cards for set where order of change is (num,color,shape,shade) repsectively in that order
#
# Returns Array holding Card objects, the Deck of Cards for Set Game.
def cardone
  num_a = [1, 2, 3] # [1, 2, 3]
  color_a = [1, 2, 3] # ['red', 'green', 'purple']
  shade_a = [1, 2, 3] # ['solid', 'striped', 'open']
  shape_a = [1, 2, 3] # ['squiggle', "diamond', 'oval']
  cards = [] # to be returned
  # loops through all cards
  (0..80).each do |n|
    # % based on when to adjust according to base-3
    cards[n] = Card.new(num_a[n % 3], color_a[(n / 3) % 3], shade_a[(n / 27) % 3], shape_a[(n / 9) % 3])
  end
  cards # returned array
end
