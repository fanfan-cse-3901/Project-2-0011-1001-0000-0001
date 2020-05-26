# frozen_string_literal: true

# File created 05/25/20 by Kevin Dong
#
$Deck = Array.new
class SetGame

  def set?
    'is set'
  end

  # Public: Verifies if incoming cards is a set.
  #
  # selections - array of cards to be matched.
  #
  # Returns true if set, otherwise false.
  def is_set(selections)
    # TODO: Actual Code
    (0..selections.length).each { |i|
      $Deck[selections[i]]
    }
    false
  end
end