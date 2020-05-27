# frozen_string_literal: true
#
require 'rspec'
require './set.rb'

describe SetGame do
  context 'When testing the SetGame class' do
    it "should say 'is set' when we call the is_set method" do
      set_vert = SetGame.new
      message = set_vert.set?
      expect(message).to eq 'is set'
    end

    it 'should return false' do
      set_vert = SetGame.new
      a = nil
      is_set = set_vert.is_set(a)
      expect(is_set).to eq false
    end
  end
end
