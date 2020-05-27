# frozen_string_literal: true

# File created 05/25/2020 by Kevin Dong

# Public: Methods for verifying if 3 cards are able to form a set.
# is_set methods should have array of 3 integers passed in.
module SetVerify
  # Public: Dummy method.
  # Outputs "is set".
  def set?
    'is set'
  end

  # Created 05/26/2020 by Kevin Dong
  # Public: Verifies if incoming cards is a set. (Looped solution)
  #
  # selections - array of 3 cards numbers (integers) to be matched.
  #
  # Returns true if set, otherwise false.
  def SetVerify.is_set_loop(selections)
    # TODO: Improve & Fix
    return false if selections.empty?

    set_indeed = true   # Cards are indeed a set.
    set_num = true      # Cards all share a number.
    set_color = true    # Cards all share a color.
    set_shade = true    # Cards all share a shade.
    set_shape = true    # Cards all share a shape.

    # Each attribute is compared.
    selections.each do |i|
      break if i == 2

      set_num = false if $Deck[selections[i]].num != $Deck[selections[i + 1]].num || $Deck[selections[0]].num == $Deck[selections[2]].num
      set_color = false if $Deck[selections[i]].color != $Deck[selections[i + 1]].color || $Deck[selections[0]].color == $Deck[selections[2]].color
      set_shade = false if $Deck[selections[i]].shade != $Deck[selections[i + 1]].shade || $Deck[selections[0]].shade == $Deck[selections[2]].shade
      set_shape = false if $Deck[selections[i]].shape != $Deck[selections[i + 1]].shape || $Deck[selections[0]].shape == $Deck[selections[2]].shape
    end

    # Cards are a set if they all share at least one or no attribute(s).
    set_indeed = true if set_num || set_color || set_shade || set_shape
    set_indeed = true unless set_num || set_color || set_shade || set_shape
    set_indeed
  end

  # Created 05/25/20 by Kevin Dong
  # Public: Verifies if incoming cards is a set.
  #
  # selections - array of cards to be matched.
  #
  # Returns true if set, otherwise false.
  def SetVerify.is_set(selections)
    return false if selections.empty?

    set_indeed = false  # Cards are indeed a set.
    set_num = false     # Cards all share a number.
    num_unique = true   # All cards have a unique number.
    set_color = false   # Cards all share a color.
    color_unique = true # All cards have a unique color.
    set_shade = false   # Cards all share a shade.
    shade_unique = true # All cards have a unique shade.
    set_shape = false   # Cards all share a shape.
    shape_unique = true # All cards have a unique shape.

    # Each attribute is compared.
    num_unique = false if $Deck[selections[0]].num == $Deck[selections[1]].num ||
                          $Deck[selections[0]].num == $Deck[selections[2]].num ||
                          $Deck[selections[1]].num == $Deck[selections[2]].num
    set_num = true if $Deck[selections[0]].num == $Deck[selections[1]].num &&
                      $Deck[selections[0]].num == $Deck[selections[2]].num &&
                      $Deck[selections[1]].num && $Deck[selections[2]].num

    color_unique = false if $Deck[selections[0]].color == $Deck[selections[1]].color ||
                            $Deck[selections[0]].color == $Deck[selections[2]].color ||
                            $Deck[selections[1]].color == $Deck[selections[2]].color
    set_color = true if $Deck[selections[0]].color == $Deck[selections[1]].color &&
                        $Deck[selections[0]].color == $Deck[selections[2]].color &&
                        $Deck[selections[1]].color == $Deck[selections[2]].color

    shade_unique = false if $Deck[selections[0]].shade == $Deck[selections[1]].shade ||
                            $Deck[selections[0]].shade == $Deck[selections[2]].shade ||
                            $Deck[selections[1]].shade == $Deck[selections[2]].shade
    set_shade = true if $Deck[selections[0]].shade == $Deck[selections[1]].shade &&
                        $Deck[selections[0]].shade == $Deck[selections[2]].shade &&
                        $Deck[selections[1]].shade == $Deck[selections[2]].shade

    shape_unique = false if $Deck[selections[0]].shape == $Deck[selections[1]].shape ||
                            $Deck[selections[0]].shape == $Deck[selections[2]].shape ||
                            $Deck[selections[1]].shape == $Deck[selections[2]].shape
    set_shape = true if $Deck[selections[0]].shape == $Deck[selections[1]].shape &&
                        $Deck[selections[0]].shape == $Deck[selections[2]].shape &&
                        $Deck[selections[1]].shape == $Deck[selections[2]].shape

    # Cards are a set if they all share at least one or no attribute(s).
    set_indeed = true if set_num || set_color || set_shade || set_shape
    set_indeed = true if num_unique && color_unique && shade_unique && shape_unique
    set_indeed
  end
end
