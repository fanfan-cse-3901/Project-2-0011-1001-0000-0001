# frozen_string_literal: true

# File created 05/24/2020 by Troy Stein
# Edited 05/27/2020 by Kevin Dong: Documentation and Style Formatting

# creates an object class
# creates a hash of hashes for the cards

#Internal: Only used for creation of deck and referring to card attributes only for this project
#
#Examples
#
#     Card.new(1,1,1,1)
#     #=>card object with num=1 color=1 shade=1 shape=1
class Card
  attr_accessor :num, :color, :shade, :shape
  def initialize(num, color, shade, shape)
    @num = num
    @color = color
    @shade = shade
    @shape = shape
  end
end

# first test case
# test code for og card
# og.num = 1
# og.shape = "blank"
# og.shade = "blank"
# og.color = "blank"
# puts og.num
i = 0 # iterator to populate hashmap
j = 0 # iterator for number
k = 0 # iterator for color
l = 0 # iterator for shade
m = 0 # iterator for shape
num_A = [1, 2, 3]
color_A = [1, 2, 3] # ["red","green","purple"]
shade_A = [1, 2, 3] # ["solid","striped","open"]
shape_A = [1, 2, 3] # ["diamond","squiggle","oval"]
cards = [] # temporary pointer

# populates the array
# num array
while j < num_A.length
  # color array
  while k < color_A.length
    # shade array
    while l < shade_A.length
      # shape array
      while m < shape_A.length
        # initializes all values
        cards[i] = Card.new(num_A[j], color_A[k], shade_A[l], shape_A[m]) # adds new Card object at a place in array
        i += 1 # adusts index of hash by one.
        m += 1
      end
      l += 1
      m = 0
    end
    k += 1
    l = 0
  end
  j += 1
  k = 0
end

$Deck = cards # makes constant pointer
# puts $Deck[45].shape
# arrays
$table = []; # shows cards on the table
$dealer = [] # shows the dealer
i = 0
# gives dealer all the cards aka the keys
while i < 81
  $dealer[i] = i
  i += 1
end
# puts $dealer[56]
$discarded = [] # shows discarded cards
