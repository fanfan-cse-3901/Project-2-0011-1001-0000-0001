# frozen_string_literal: true

# File created 05/25/2020 by Kevin Dong
# File created 05/27/2020 by Kevin Dong: Logic reworking.
# File edited 05/31/2020 by Kevin Dong: Style checks, refactoring.
# File edited 06/01/2020 by Kevin Dong: find_set method TDD.
require './set_setup.rb'
# Public: Methods for verifying if 3 cards are able to form a set.
# is_set? methods should have array of 3 integers passed in.
# find_set methods should have array of 2 integers passed in.
module SetVerify
  # Public: Dummy method.
  # Outputs "is set".
  def self.set?
    'is set'
  end

  # Created 05/26/2020 by Kevin Dong
  # Public: Verifies if incoming cards is a set. (Looped solution)
  #
  # selections - array of 3 cards numbers (integers) to be matched.
  #
  # Returns true if set, otherwise false.
  def self.is_set_loop(selections)
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

      set_num = false if deck[selections[i]].num != deck[selections[i + 1]].num ||
                         deck[selections[0]].num == deck[selections[2]].num
      set_color = false if deck[selections[i]].color != deck[selections[i + 1]].color ||
                           deck[selections[0]].color == deck[selections[2]].color
      set_shade = false if deck[selections[i]].shade != deck[selections[i + 1]].shade ||
                           deck[selections[0]].shade == deck[selections[2]].shade
      set_shape = false if deck[selections[i]].shape != deck[selections[i + 1]].shape ||
                           deck[selections[0]].shape == deck[selections[2]].shape
    end

    # Cards are a set if they all share at least one or no attribute(s).
    set_indeed = true if set_num || set_color || set_shade || set_shape
    set_indeed = true unless set_num || set_color || set_shade || set_shape
    set_indeed
  end

  # Created 05/25/2020 by Kevin Dong
  # Public: Verifies if incoming cards is a set.
  #
  # selections - array of cards to be matched.
  #
  # Returns true if set, otherwise false.
  def self.is_set?(selections)
    return false if selections.length < 3

    deck = cardone
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
    num_unique = false if (deck[selections[0]].num == deck[selections[1]].num) ||
                          (deck[selections[0]].num == deck[selections[2]].num) ||
                          (deck[selections[1]].num == deck[selections[2]].num)
    set_num = true if (deck[selections[0]].num == deck[selections[1]].num) &&
                      (deck[selections[0]].num == deck[selections[2]].num) &&
                      (deck[selections[1]].num == deck[selections[2]].num)

    color_unique = false if (deck[selections[0]].color == deck[selections[1]].color) ||
                            (deck[selections[0]].color == deck[selections[2]].color) ||
                            (deck[selections[1]].color == deck[selections[2]].color)
    set_color = true if (deck[selections[0]].color == deck[selections[1]].color) &&
                        (deck[selections[0]].color == deck[selections[2]].color) &&
                        (deck[selections[1]].color == deck[selections[2]].color)

    shade_unique = false if (deck[selections[0]].shade == deck[selections[1]].shade) ||
                            (deck[selections[0]].shade == deck[selections[2]].shade) ||
                            (deck[selections[1]].shade == deck[selections[2]].shade)
    set_shade = true if deck[selections[0]].shade == deck[selections[1]].shade &&
                        deck[selections[0]].shade == deck[selections[2]].shade &&
                        deck[selections[1]].shade == deck[selections[2]].shade

    shape_unique = false if deck[selections[0]].shape == deck[selections[1]].shape ||
                            deck[selections[0]].shape == deck[selections[2]].shape ||
                            deck[selections[1]].shape == deck[selections[2]].shape
    set_shape = true if deck[selections[0]].shape == deck[selections[1]].shape &&
                        deck[selections[0]].shape == deck[selections[2]].shape &&
                        deck[selections[1]].shape == deck[selections[2]].shape

    # Cards are a set if they all share at least one or no attribute(s).
    ((num_unique ^ set_num) && (color_unique ^ set_color) && (shade_unique ^ set_shade) && (shape_unique ^ set_shape))
  end

  # Created 05/31/2020 by Kevin Dong
  # Edited 06/02/2020 by Kevin Dong: Instead of 2 cards, N # of cards N > 3
  # Public: Given array of cards, find potential sets.
  #
  # selections - array of N cards to be matched
  #
  # Returns array of potential sets within the array.
  def self.find_set(selections)
    return [] if selections.length < 3

    set_list = []
    (selections.length - 2).times do |i|
      (selections.length - 1).times do |j|
        next unless j > i

        selections.length.times do |k|
          next unless k > j

          if is_set?([selections[i], selections[j], selections[k]])
            set_list.push [selections[i], selections[j], selections[k]]
          end
        end
      end
    end
    set_list
  end

  # Created 06/03/2020 by Kevin Dong
  # Internal: Given array of cards, find potential sets.
  #
  # selections - array of N cards to be matched
  #
  # Returns array of potential sets within the array.
  def self.find_set(selections)
    return [] if selections.length < 3

    set_list = []
    (selections.length - 2).times do |i|
      (selections.length - 1).times do |j|
        next unless j > i

        selections.length.times do |k|
          next unless k > j

          if is_set?([selections[i], selections[j], selections[k]])
            set_list.push [selections[i], selections[j], selections[k]]
          end
        end
      end
    end
    set_list
  end
end