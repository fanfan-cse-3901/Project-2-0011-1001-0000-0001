# frozen_string_literal: true

require_relative './set_verify.rb'
require_relative './set_setup.rb'
require_relative './hint_generator.rb'
require_relative './gen_table_img.rb'

# This modules contains methods to set up the table correctly.
# Call TableSetting.set_table from this module
# Methods implemented are set_table, print_table, and at_least_one_set
#
# Created on 5/26/2020 by Prachiti Garge
# Edited on 5/27/2020 by Prachiti Garge: Deleted others' code copy and instead put commands to access their code directly.
# Edited on 6/1/2020 by Prachiti Garge: Changed the way deck is accessed according to set_setup new version.
# Edited 06/03/2020 by Kevin Dong: Continued fixes to resume functionality + Documentation.
# Edited on 6/4/2020 by Prachiti Garge: Debugged the module and made provisions to show hints.
# Edited on 6/5/2020 by Prachiti Garge: Added gui call to visually present table.
module TableSetting

  include SetVerify
  include Hint


  # Private: Checks if there is at least one set on the table.
  # table - Array that contains keys of cards on the table
  #
  # Created on 5/26/2020 by Prachiti Garge
  def self.at_least_one_set?(table)
    val = false
    unless table.length.zero?
      (0...(table.length - 2)).each do |i|
        ((i + 1)...(table.length - 1)).each do |j|
          ((j + 1)...table.length).each do |k|
            val = true if SetVerify.is_set?([table[i], table[j], table[k]])
            break if val
          end
          break if val
        end
        break if val
      end
    end
    val
  end

  # Private: Prints out table
  # table - Array of keys of cards on table
  # message - Array of strings to print with other notifications
  #
  # Created on 5/26/2020 by Prachiti Garge
  # Edited on 6/4/2020 by Prachiti Garge: Added difficulty level appropriate hints to the table
  # Edited on 6/5/2020 by Prachiti Garge: Added GUI call and corrected hint calling.
  def self.print_table(table, message, level)
    d = cardone # Gets the deck
    numbers = %w[one two three]
    shapes = %w[diamond squiggle oval]
    colors = %w[red green purple]
    shades = %w[solid striped open]
    # Prints out each card on the table
    gen_table_img(table)
    unless table.length.zero?
      puts
      table.each_index { |n| puts "#{n + 1}: #{numbers[(d[table[n].to_i].num.to_i - 1)]}, #{shapes[(d[table[n].to_i].shape.to_i - 1)]}, #{colors[(d[table[n].to_i].color.to_i - 1)]}, #{shades[(d[table[n].to_i].shade.to_i - 1)]}" }
    end
    puts message
    puts
    if level == 'e'
      Hint.generate_hint_easy(table)
    elsif level == 'm'
      Hint.generate_hint_medium(table)
    else
      Hint.generate_hint_difficult(table)
    end
    puts
    true
  end

  # Public: Deals the appropriate number of cards and displays the table.
  # table - Array of card keys on the table
  # dealer - Array of card keys yet to be seen by the player
  #
  # Created on 5/26/2020 by Prachiti Garge
  # Edited on 6/4/2020 by Prachiti Garge: Changed output for testing, added parameter to generate hint based on difficulty level
  def self.set_table(table, dealer, level)
    # Default message
    message = []

    # This loop adds three cards at a time.
    while !dealer.length.zero? && (table.length < 12 || (table.length >= 12 && !at_least_one_set?(table)))
      # Add 3 cards to table and remove from dealer
      3.times do
        val = dealer.sample
        table.push(val)
        dealer.delete(val)
      end
    end

    # Put additional messages if required.
    message.push('Extra cards were dealt to ensure presence of at least one set.') if table.length > 12
    message.push('There are no more cards left to deal.') if dealer.length.zero?
    # Print out the table and message
    ret_print = print_table(table, message, level)
    # For testing, I will return a boolean to check if cards are printed.
    ret_print
  end

end

