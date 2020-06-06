# frozen_string_literal: true

require_relative './set_verify.rb'
require_relative './set_setup.rb'


# Provides methods to generate hints.
# All methods are module methods and should be called on the Hint module.
#
# Examples
#
# Hint.generate_hint(table)
# # => "The number of sets present on the table are: 1"
# Created on 5/31/2020 by Prachiti Garge
# Edited on 6/1/2020 by Prachiti Garge
module Hint

  # Generates hint to show number of sets on table.
  #
  # table - Array with keys referring to cards.
  #
  # Returns number of sets present on the table.
  # Created on 5/31/2020 by Prachiti Garge
  # Edited on 6/1/2020 by Prachiti Garge: Corrected call to SetVerify.is_set?
  def self.generate_hint_difficult(table)
    val = 0
    unless table.empty?
      (0...(table.length - 2)).each do |i|
        ((i + 1)...(table.length - 1)).each do |j|
          ((j + 1)...table.length).each do |k|
            val += 1 if SetVerify.is_set?([table[i], table[j], table[k]])
          end
        end
      end
    end
    str = "HINT: The number of sets present on the table are: #{val}"
    puts str
    str
  end

  # Generates hint to show number of sets that a card is a part of.
  #
  # table - Array with keys referring to cards.
  #
  # Returns number of sets consisting a card.
  # Created on 6/1/2020 by Prachiti Garge
  # Edited on 6/5/2020 by Prachiti Garge: Renamed and implemented the easy version
  def self.generate_hint_easy(table)
    d = cardone
    str = 'No cards are present on the table.'
    numbers = %w[one two three]
    shapes = %w[diamond squiggle oval]
    colors = %w[red green purple]
    shades = %w[solid striped open]
    if !table.length.zero?
      sets = SetVerify.find_set(table)
      if sets.length.zero?
        str = 'No sets are present on the table.'
        puts str
      else
        str = "HINT: Find a card that makes a set with the cards #{numbers[(d[sets[0][0].to_i].num.to_i - 1)]}, #{shapes[(d[sets[0][0].to_i].shape.to_i - 1)]}, #{colors[(d[sets[0][0].to_i].color.to_i - 1)]}, #{shades[(d[sets[0][0].to_i].shade.to_i - 1)]} and #{numbers[(d[sets[0][1].to_i].num.to_i - 1)]}, #{shapes[(d[sets[0][1].to_i].shape.to_i - 1)]}, #{colors[(d[sets[0][1].to_i].color.to_i - 1)]}, #{shades[(d[sets[0][1].to_i].shade.to_i - 1)]}."
        puts str
      end
    else
       puts str
    end
    str
  end

  # Generates hint to give information about two attributes in any one set on the table.
  #
  # table - Array with keys referring to cards.
  #
  # Prints out info about two attributes of a set present on the table.
  # Created on 6/4/2020 by Prachiti Garge
  def self.generate_hint_medium(table)
    d = cardone
    str = 'No cards are present on the table.'
    unless table.length.zero?
      set_list = SetVerify.find_set table
      if set_list.length.zero?
        str = 'No sets are present on the table.'
      else
        set = set_list[0]
        num_same = d[set[0]].num == d[set[1]].num
        color_same = d[set[0]].color == d[set[1]].color
        str = if num_same && color_same
                'HINT: There is a set which has the same number and same color.'
              elsif !num_same && color_same
                'HINT: There is a set which has all different numbers and same color.'
              elsif num_same && !color_same
                'HINT: There is a set which has the same number and all different colors.'
              else
                'HINT: There is a set which has all different numbers and all different colors.'
              end
         end
    end
    puts str
    str
  end
end