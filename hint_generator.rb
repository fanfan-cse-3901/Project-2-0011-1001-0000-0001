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
  # Generates hint to show number of sets on table.
  #
  # table - Array with keys referring to cards.
  #
  # Returns number of sets present on the table.
  # Created on 5/31/2020 by Prachiti Garge
  # Edited on 6/1/2020 by Prachiti Garge: Corrected call to SetVerify.is_set?
  def self.generate_hint_1(table)
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
  def self.generate_hint_2(table)
    str = 'No cards are present on the table.'

    puts str
    str
  end
end