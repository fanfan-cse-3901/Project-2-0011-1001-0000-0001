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
module Hint
  # Generates hint to show number of sets on table.
  #
  # table - Array with keys referring to cards.
  #
  # Returns number of sets present on the table.
  def self.generate_hint_1(table)
    val = 0
    fs = File.open('sets_by_keys_newer_set','w')
    unless table.empty?
      (0...(table.length - 2)).each do |i|
        ((i + 1)...(table.length - 1)).each do |j|
          ((j + 1)...table.length).each do |k|
            val += 1 if SetVerify.is_set?([table[i], table[j], table[k]])
            fs.puts "#{i}, #{j}, #{k}" if SetVerify.is_set?([table[i], table[j], table[k]])
          end
        end
      end
      fs.close
    end
    puts "The number of sets present on the table are: #{val}"
  end

  def self.generate_hint_2(table)
    str = 'No cards are present on the table.'

    puts str
  end
end
Hint.generate_hint_1((0..80).to_a)