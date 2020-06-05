# frozen_string_literal: true

require_relative './set_verify.rb'
require_relative './set_setup.rb'
# require_relative './table_setting_script.rb'

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

  d = cardone
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
    str = "The number of sets present on the table are: #{val}"
    puts str
    str
  end

  # Generates hint to show number of sets that a card is a part of.
  #
  # table - Array with keys referring to cards.
  #
  # Returns number of sets consisting a card.
  # Created on 6/1/2020 by Prachiti Garge
  # Edited on 6/4/2020 by Prachiti Garge: Renamed and implemented the easy version
  def self.generate_hint_easy(table)
    str = 'No cards are present on the table.'
    sets
    puts str
    str
  end

  # Generates hint to give information about two attributes in any one set on the table.
  #
  # table - Array with keys referring to cards.
  #
  # Prints out info about two attributes of a set present on the table.
  # Created on 6/4/2020 by Prachiti Garge
  def self.generate_hint_medium(table)
    str = 'No cards are present on the table.'
    if table.!empty?
      set_list = SetVerify.find_set table
      if set_list.empty?
        str = 'No sets are present on the table.'
      else
        set = set_list[0]
        num_same = d[set[0]].num == d[set[1]].num
        color_same = d[set[0]].color == d[set[1]].color
        str = if num_same && color_same
                'There is a set which has the same number and same color.'
              elsif !num_same && color_same
                'There is a set which has all different numbers and same color.'
              elsif num_same && !color_same
                'There is a set which has the same number and all different colors.'
              else
                'There is a set which has all different numbers and all different colors.'
              end
         end
    end
    puts str
    str
  end
end