# frozen_string_literal: true

# File created 05/25/20 by Kevin Dong

# Card Object init from Troy Stein's repo
class Card
  attr_accessor :num, :color, :shade, :shape
  def initialize(num, color, shade, shape)
    @num = num
    @color = color
    @shade = shade
    @shape = shape
  end
end
i=0 #iterator to populate hashmap
j=0 #iterator for number
k=0 #iterator for color
l=0 #iterator for shade
m=0 #iterator for shape
num_A=[1,2,3]
color_A=[1,2,3]#["red","green","purple"]
shade_A=[1,2,3]#["solid","striped","open"]
shape_A=[1,2,3]#["diamond","squiggle","oval"]
cards = Array.new #temporary pointer
m+=1
#populates the hashmap
#num array
while j <num_A.length
  #color array
  while k<color_A.length
    #shade array
    while l<shade_A.length
      #shape array
      while m<shape_A.length
        #initializes all values
        cards[i] = Card.new(num_A[j],color_A[k],shade_A[l],shape_A[m]) #adds new Card object at a place in array
        i+=1 #adusts index of hash by one.
        m+=1
      end
      l+=1
      m=0
    end
    k+=1
    l=0
  end
  j+=1
  k=0
end
$Deck = cards

#Model class for Set game
class SetGame

  def set?
    'is set'
  end

  # Public: Verifies if incoming cards is a set. (Looped solution)
  #
  # selections - array of 3 cards to be matched.
  #
  # Returns true if set, otherwise false.
  def is_set_loop(selections)
    set_indeed = true   # Cards are indeed a set.
    set_num = true      # Cards all share a number.
    set_color = true    # Cards all share a color.
    set_shade = true    # Cards all share a shade.
    set_shape = true    # Cards all share a shape.

    # Each attribute is compared.
    selections.each do |i|
      break if i == 2

      set_num = false if $Deck[selections[i]].num != $Deck[selections[i + 1]].num
      set_color = false if $Deck[selections[i]].color != $Deck[selections[i + 1]].color
      set_shade = false if $Deck[selections[i]].shade != $Deck[selections[i + 1]].shade
      set_shape = false if $Deck[selections[i]].shape != $Deck[selections[i + 1]].shape
    end

    # Cards are a set if they all share at least one or no attribute(s).
    set_indeed = true if set_num || set_color || set_shade || set_shape
    set_indeed = true unless set_num || set_color || set_shade || set_shape
    set_indeed
  end

  # Public: Verifies if incoming cards is a set.
  #
  # selections - array of cards to be matched.
  #
  # Returns true if set, otherwise false.
  def is_set(selections)
    set_indeed = false  # Cards are indeed a set.
    set_num = false     # Cards all share a number.
    set_color = false   # Cards all share a color.
    set_shade = false   # Cards all share a shade.
    set_shape = false   # Cards all share a shape.

    # Each attribute is compared.
    if $Deck[selections[0]].num == $Deck[selections[1]].num
      set_num = true if $Deck[selections[1]].num == $Deck[selections[2]].num
    end
    if $Deck[selections[0]].color == $Deck[selections[1]].color
      set_color = true if $Deck[selections[1]].color == $Deck[selections[2]].color
    end
    if $Deck[selections[0]].shade == $Deck[selections[1]].shade
      set_shade = true if $Deck[selections[1]].shade == $Deck[selections[2]].shade
    end
    if $Deck[selections[0]].shape == $Deck[selections[1]].shape
      set_shape = true if $Deck[selections[1]].shape == $Deck[selections[2]].shape
    end

    # Cards are a set if they all share at least one or no attribute(s).
    set_indeed = true if set_num || set_color || set_shade || set_shape
    set_indeed = true unless set_num || set_color || set_shade || set_shape
    set_indeed
  end
end