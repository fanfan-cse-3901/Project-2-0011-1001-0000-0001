# frozen_string_literal: true

require_relative './spec_helper'
require_relative '../hint_generator'

# Created on 5/31/2020 by Prachiti Garge
# Edited on 6/5/2020 by Prachiti Garge: Added test cases for generate_hint_easy and generate_hint_medium.
RSpec.describe Hint do
  context 'table is empty' do
    it 'prints that 0 sets are present, for difficult level' do
      tab = []
      output = 'HINT: The number of sets present on the table are: 0'
      expect(Hint.generate_hint_difficult(tab)).to eq(output)
    end

    it 'prints that no cards are present on the table, for easy level' do
      tab = []
      output = 'No cards are present on the table.'
      expect(Hint.generate_hint_easy(tab)).to eq(output)
    end

    it 'prints that no cards are present on the table, for medium level' do
      tab = []
      output = 'No cards are present on the table.'
      expect(Hint.generate_hint_medium(tab)).to eq(output)
    end
  end

  context 'table has 3 cards' do
    it 'prints that 1 set is present, for difficult level' do
      tab = [54, 27, 0]
      output = 'HINT: The number of sets present on the table are: 1'
      expect(Hint.generate_hint_difficult(tab)).to eq(output)
    end

    it 'prints information about num and color, for medium level' do
      tab = [54, 27, 0]
      output = 'HINT: There is a set which has the same number and same color.'
      expect(Hint.generate_hint_medium(tab)).to eq(output)
    end

    it 'prints info about two cards in a set, for easy level' do
      tab = [54, 27, 0]
      output = 'HINT: Find a card that makes a set with the cards one, diamond, red, open and one, diamond, red, striped.'
      expect(Hint.generate_hint_easy(tab)).to eq(output)
    end

    it 'prints that 0 sets are present, for difficult level' do
      tab = [1, 17, 16]
      output = 'HINT: The number of sets present on the table are: 0'
      expect(Hint.generate_hint_difficult(tab)).to eq(output)
    end

    it 'prints that no sets are present on the table, for medium level' do
      tab = [17, 16, 1]
      output = 'No sets are present on the table.'
      expect(Hint.generate_hint_medium(tab)).to eq(output)
    end

    it 'prints that no sets are present on the table, for easy level' do
      tab = [16, 1, 17]
      output = 'No sets are present on the table.'
      expect(Hint.generate_hint_easy(tab)).to eq(output)
    end
  end

  context 'table has 6 cards' do
    it 'prints that 2 sets are present, for difficult level' do
      tab = [1, 15, 23, 59, 31, 3]
      output = 'HINT: The number of sets present on the table are: 2'
      expect(Hint.generate_hint_difficult(tab)).to eq(output)
    end

    it 'prints information about num and color, for medium level' do
      tab = [1, 15, 23, 59, 31, 3]
      output = 'HINT: There is a set which has all different numbers and all different colors.'
      expect(Hint.generate_hint_medium(tab)).to eq(output)
    end

    it 'prints info about two cards in a set, for easy level' do
      tab = [1, 15, 23, 59, 31, 3]
      output = 'HINT: Find a card that makes a set with the cards two, diamond, red, solid and one, squiggle, purple, solid.'
      expect(Hint.generate_hint_easy(tab)).to eq(output)
    end

    it 'prints that 1 set is present, for difficult level' do
      tab = [6, 5, 25, 9, 37, 55]
      output = 'HINT: The number of sets present on the table are: 1'
      expect(Hint.generate_hint_difficult(tab)).to eq(output)
    end

    it 'prints information about num and color, for medium level' do
      tab = [6, 5, 25, 9, 37, 55]
      output = 'HINT: There is a set which has all different numbers and all different colors.'
      expect(Hint.generate_hint_medium(tab)).to eq(output)
    end

    it 'prints info about two cards in a set, for easy level' do
      tab = [6, 5, 25, 9, 37, 55]
      output = 'HINT: Find a card that makes a set with the cards three, diamond, green, solid and two, oval, purple, solid.'
      expect(Hint.generate_hint_easy(tab)).to eq(output)
    end

    it 'prints that 0 sets are present, for difficult level' do
      tab = [16, 17, 14, 18, 79, 53]
      output = 'HINT: The number of sets present on the table are: 0'
      expect(Hint.generate_hint_difficult(tab)).to eq(output)
    end

    it 'prints that no sets are present on the table, for medium level' do
      tab = [16, 17, 14, 18, 79, 53]
      output = 'No sets are present on the table.'
      expect(Hint.generate_hint_medium(tab)).to eq(output)
    end

    it 'prints that no sets are present on the table, for easy level' do
      tab = [16, 17, 14, 18, 79, 53]
      output = 'No sets are present on the table.'
      expect(Hint.generate_hint_easy(tab)).to eq(output)
    end
  end

  context 'table has 12 cards' do
    it 'prints that 4 sets are present, for difficult level' do
      tab = [6, 5, 25, 9, 37, 55, 1, 15, 23, 59, 31, 3]
      output = 'HINT: The number of sets present on the table are: 4'
      expect(Hint.generate_hint_difficult(tab)).to eq(output)
    end

    it 'prints information about num and color, for medium level' do
      tab = [6, 5, 25, 9, 37, 55, 1, 15, 23, 59, 31, 3]
      output = 'HINT: There is a set which has all different numbers and all different colors.'
      expect(Hint.generate_hint_medium(tab)).to eq(output)
    end

    it 'prints info about two cards in a set, for easy level' do
      tab = [6, 5, 25, 9, 37, 55, 1, 15, 23, 59, 31, 3]
      output = 'HINT: Find a card that makes a set with the cards one, diamond, purple, solid and three, diamond, green, solid.'
      expect(Hint.generate_hint_easy(tab)).to eq(output)
    end
    it 'prints that 0 sets are present, for difficult level' do
      tab = [16, 17, 14, 18, 79, 53, 55, 46, 63, 1, 19, 0]
      output = 'HINT: The number of sets present on the table are: 0'
      expect(Hint.generate_hint_difficult(tab)).to eq(output)
    end
   end
end