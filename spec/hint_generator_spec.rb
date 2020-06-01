# frozen_string_literal: true

require_relative './spec_helper'
require_relative '../hint_generator'

RSpec.describe TableSetting do
  context 'table is empty' do
    it 'prints that 0 sets are present' do
      tab = []
      output = 'The number of sets present on the table are: 0'
      expect(Hint.generate_hint_1(tab)).to eq(output)
    end

    it 'prints that no cards are present on the table' do
      tab = []
      output = 'No cards are present on the table.'
      expect(Hint.generate_hint_2(tab)).to eq(output)
    end
  end

  context 'table has 3 cards' do
    it 'prints that 1 set is present' do
      tab = []
      output = 'The number of sets present on the table are: 1'
      expect(Hint.generate_hint_1(tab)).to eq(output)
    end

    it 'prints that 0 sets are present' do
      tab = []
      output = 'The number of sets present on the table are: 0'
      expect(Hint.generate_hint_1(tab)).to eq(output)
    end
  end

  context 'table has 6 cards' do
    it 'prints that 2 sets are present' do
      tab = []
      output = 'The number of sets present on the table are: 2'
      expect(Hint.generate_hint_1(tab)).to eq(output)
    end

    it 'prints that 1 set is present' do
      tab = []
      output = 'The number of sets present on the table are: 1'
      expect(Hint.generate_hint_1(tab)).to eq(output)
    end

    it 'prints that 0 sets are present' do
      tab = []
      output = 'The number of sets present on the table are: 0'
      expect(Hint.generate_hint_1(tab)).to eq(output)
    end
  end

  context 'table has 12 cards' do
    it 'prints that x sets are present' do
      tab = []
      output = 'The number of sets present on the table are: x'
      expect(Hint.generate_hint_1(tab)).to eq(output)
    end

    it 'prints that 0 sets are present' do
      tab = []
      output = 'The number of sets present on the table are: 0'
      expect(Hint.generate_hint_1(tab)).to eq(output)
    end
  end

  context 'table has 15 cards' do
    it 'prints that x sets are present' do
      tab = []
      output = 'The number of sets present on the table are: x'
      expect(Hint.generate_hint_1(tab)).to eq(output)
    end
  end
end