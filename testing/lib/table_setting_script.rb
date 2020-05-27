##
# frozen_string_literal: true

# Pasting Troy's code here to get the card object
#creates an object class
#creates a hash of hashes for the cards
class Card
  attr_accessor :num,:color,:shade,:shape
  def initialize(num,color,shade,shape)
    @num=num
    @color=color
    @shade=shade
    @shape=shape
  end
end
#first test case
#test code for og card
#og.num=1
#og.shape="blank"
#og.shade="blank"
#og.color="blank"
#puts og.num
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
# m+=1 Troy needs to delete this line from his code
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
$Deck = cards #makes constant pointer
#puts $Deck[45].shape
#arrays
$table=Array.new; #shows cards on the table
$dealer=Array.new #shows the dealer
i=0
#gives dealer all the cards aka the keys
while i<81
  $dealer[i]=i
  i+=1
end
#puts $dealer[56]
$discarded=Array.new #shows discarded cards
# Here Troy's code ends

# TableSetting
# This modules contains methods to set up the table correctly.
# Others only need to call TableSetting.set_table from this module
# Created on 5/26/2020 by Prachiti Garge

module TableSetting

  # frozen_string_literal: true
  # Pasting Kevin's implementation
  # Method created by Kevin Dong

  def self.is_set(selections)
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

  # Checks if there is at least one set on the table.
  # Created on 5/26/2020 by Prachiti Garge

  def self.at_least_one_set(table)
    val = false
    if table.length > 0
      for i in 0...(table.length-2)
        for j in (i+1)...(table.length-1)
          for k in (j+1)...table.length
            val = true if is_set([table[i], table[j], table[k]])
            break if val == true
          end
          break if val == true
        end
        break if val == true
      end
    end
    val
  end

  # Prints out table
  # Created on 5/26/2020 by Prachiti Garge

  def self.print_table(table, message)
    numbers = %w[one two three]
    shapes = %w[diamond squiggle oval]
    colors = %w[red green purple]
    shades = %w[solid stripped open]
    # Prints out each card on the table
    unless table.length.zero?
      for n in 0...table.length
        puts "#{n + 1}: #{numbers[($Deck[table[n]].num - 1)]}, #{shapes[($Deck[table[n]].shape - 1)]}, #{colors[($Deck[table[n]].color - 1)]}, #{shades[($Deck[table[n]].shade - 1)]}"
      end
    end
    puts message
    puts
  end

  # Deals the appropriate number of cards and displays the table.
  # Only this method needs to be called by the others.
  # Created on 5/26/2020 by Prachiti Garge

  def self.set_table(table, dealer)
    # Default message
    message = []

    # This loop adds three cards at a time.
    while (!dealer.length.zero? && (table.length < 12 || (table.length >= 12 && !at_least_one_set(table))))
      # Add 3 cards to table and remove from dealer
      3.times do
        val = dealer.sample.to_i
        table.push(val)
        dealer.delete(val)
      end
    end
    # Put additional messages if required.
    message.push('Extra cards were dealt to ensure presence of at least one set.') if table.length > 12
    message.push('There are no more cards left to deal.') if dealer.length.zero?
    # Print out the table and message

    print_table(table, message)
    # For testing, I will return a boolean to check if conditions were correctly implemented to add cards.
    at_least_one_set(table) || dealer.length.zero?
  end
end
