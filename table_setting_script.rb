# frozen_string_literal: true

require_relative './set_verify.rb'
require_relative './set_setup.rb'

# This modules contains methods to set up the table correctly.
# Others only need to call TableSetting.set_table from this module
# Methods implemented are set_table, print_table, and at_least_one_set
#
# Created on 5/26/2020 by Prachiti Garge
# Edited on 5/27/2020 by Prachiti Garge: Deleted others' code copy and instead put commands to access their code directly.
# Edited on 6/1/2020 by Prachiti Garge: Changed the way deck is accessed according to set_setup new version.
module TableSetting

  include SetVerify

  # Checks if there is at least one set on the table.
  # table - Array that contains keys of cards on the table
  #
  # Created on 5/26/2020 by Prachiti Garge
  def self.at_least_one_set?(table)
    val = false
    unless table.empty?
      (0...(table.length - 2)).each do |i|
        ((i + 1)...(table.length - 1)).each do |j|
          ((j + 1)...table.length).each do |k|
            val = true if SetVerify.is_set?([table[i], table[j], table[k]])
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
  # table - Array of keys of cards on table
  # message - Array of strings to print with other notifications
  #
  # Created on 5/26/2020 by Prachiti Garge
  def self.print_table(table, message)
    d = cardone # Gets the deck
    numbers = %w[one two three]
    shapes = %w[diamond squiggle oval]
    colors = %w[red green purple]
    shades = %w[solid striped open]
    # Prints out each card on the table
    unless table.length.zero?
      (0...table.length).each do |n|
        puts "#{table[n]}: #{numbers[(d[table[n]].num - 1)]}, #{shapes[(d[table[n]].shape - 1)]}, #{colors[(d[table[n]].color - 1)]}, #{shades[(d[table[n]].shade - 1)]}"
      end
    end
    puts message
    puts
  end

  # Deals the appropriate number of cards and displays the table.
  # table - Array of card keys on the table
  # dealer - Array of card keys yet to be seen by the player
  #
  # Created on 5/26/2020 by Prachiti Garge
  def self.set_table(table, dealer)
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
    print_table(table, message)
    # For testing, I will return a boolean to check if conditions were correctly implemented to add cards.
    at_least_one_set?(table) || dealer.length.zero?
  end
end
