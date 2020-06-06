# frozen_string_literal: true

require_relative './spec_helper'
require_relative '../table_setting_script'

# Created on 5/26/2020 by Prachiti Garge
# Edited on 6/5/2020 by Prachiti Garge: Updated call to TableSetting.set_table method.
RSpec.describe TableSetting do
  context 'table is empty' do
    it 'Gets the proper dealt cards with at least one set when dealer has greater than 12 cards' do
      tab = []
      deal = []
      level = 'd'
      18.times do
        deal.push(rand(0..80))
      end
      expect(TableSetting.set_table(tab, deal, level)).to eq(true)
    end

    it 'Gets the proper dealt cards with at least one set when dealer is non-empty, less than 12 cards' do
      tab = []
      deal = []
      level = 'm'
      9.times do
        deal.push(rand(0..80))
      end
      expect(TableSetting.set_table(tab, deal, level)).to eq(true)
    end

    it 'displays empty table and message when dealer is empty' do
      tab = []
      deal = []
      level = 'e'
      expect(TableSetting.set_table(tab, deal, level)).to eq(true)
    end
  end

  context 'table is has less than 12 elements and greater than 0 elements, here 6' do
    it 'Gets the proper dealt cards with at least one set when dealer has greater than 6 cards' do
      tab = []
      deal = []
      level = 'd'
      6.times do
        tab.push(rand(0..39))
      end
      12.times do
        deal.push(rand(40..80))
      end
      expect(TableSetting.set_table(tab, deal,level)).to eq(true)
    end

    it 'Gets the proper dealt cards with at least one set when dealer is non-empty, less than 6 cards' do
      tab = []
      deal = []
      level = 'e'
      6.times do
        tab.push(rand(0..39))
      end
      3.times do
        deal.push(rand(40..80))
      end
      expect(TableSetting.set_table(tab, deal, level)).to eq(true)
    end

    it 'displays table and message when dealer is empty' do
      tab = []
      deal = []
      level = 'm'
      6.times do
        tab.push(rand(0..80))
      end
      expect(TableSetting.set_table(tab, deal, level)).to eq(true)
    end
  end

  context 'table has 12 elements' do
    it 'Gets the proper dealt cards with dealer non-empty' do
      tab = []
      deal = []
      level = 'm'
      12.times do
        tab.push(rand(40..80))
      end
      24.times do
        deal.push(rand(0..39))
      end
      expect(TableSetting.set_table(tab, deal,level)).to eq(true)
    end

    it 'Gets the proper dealt cards with dealer empty' do
      tab = []
      deal = []
      level = 'e'
      12.times do
        tab.push(rand(0..80))
      end
      expect(TableSetting.set_table(tab, deal, level)).to eq(true)
    end
  end

  context 'table has 15 elements' do
    it 'with dealer being non-empty, only adds when no set present' do
      tab = []
      deal = []
      level = 'd'
      15.times do
        tab.push(rand(40..80))
      end
      21.times do
        deal.push(rand(0..39))
      end
      expect(TableSetting.set_table(tab, deal, level)).to eq(true)
    end

    it 'with dealer being empty, does not add anything' do
      tab = []
      deal = []
      level = 'e'
      15.times do
        tab.push(rand(0..80))
      end
      expect(TableSetting.set_table(tab, deal, level)).to eq(true)
    end
  end
end


