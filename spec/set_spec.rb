# frozen_string_literal: true

# File created 05/25/2020 by Kevin Dong
# Edited 05/30/2020 by Kevin Dong: Test refactoring, cleanup, and fixes
require 'rspec'
require './set_setup.rb'
require './set_verify.rb'
require './table_setting_script.rb'

# TableSetting.print_table((0..80).to_a,'yeet we complete')
# Test Begin
describe SetVerify do
  context 'When testing the SetGame is_set? methods' do
    it "should say 'is set' when we call the is_set? method" do
      a = []
      message = SetVerify.set?
      expect(message).to eq 'is set'
    end

    # Empty
    it 'should return false' do
      a = []
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end

    # Rotate card order Unique Set
    it 'should return true' do
      a = [0, 40, 80]
      # c = 1, n = 1, d = 1, p = 1
      # c = 2, n = 2, d = 2, p = 2
      # c = 3, n = 3, d = 3, p = 3
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [0, 80, 40]
      # c = 1, n = 1, d = 1, p = 1
      # c = 3, n = 3, d = 3, p = 3
      # c = 2, n = 2, d = 2, p = 2
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [40, 0, 80]
      # c = 2, n = 2, d = 2, p = 2
      # c = 1, n = 1, d = 1, p = 1
      # c = 3, n = 3, d = 3, p = 3
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [40, 80, 0]
      # c = 2, n = 2, d = 2, p = 2
      # c = 3, n = 3, d = 3, p = 3
      # c = 1, n = 1, d = 1, p = 1
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [80, 40, 0]
      # c = 3, n = 3, d = 3, p = 3
      # c = 2, n = 2, d = 2, p = 2
      # c = 1, n = 1, d = 1, p = 1
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [80, 0, 40]
      # c = 3, n = 3, d = 3, p = 3
      # c = 1, n = 1, d = 1, p = 1
      # c = 2, n = 2, d = 2, p = 2
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end

    # Rotate card order Set with 3 attributes same (1 attribute unique)
    it 'should return true' do
      a = [0, 1, 2] # Card Numbers 1, 2, 3
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [0, 2, 1]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [1, 0, 2]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [1, 2, 0]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [2, 0, 1]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [2, 1, 0]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end

    # Rotate card order Set with 2 attributes same (2 attributes unique)
    it 'should return true' do
      a = [0, 28, 56] # Card Numbers 1, 29, 57
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [0, 56, 28]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [28, 0, 56]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [28, 56, 0]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [56, 0, 28]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [56, 28, 0]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end

    # Rotate card order Set with 1 attributes same (3 attributes unique)
    it 'should return true' do
      a = [0, 13, 26] # Card Numbers 1, 14, 27
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [0, 26, 13]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [13, 0, 26]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [13, 26, 0]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [26, 0, 13]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      a = [26, 13, 0]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq true
    end

    # Rotate Not a Set with 1 attribute 2/1 (2 attributes same)
    it 'should return false' do
      a = [1, 2, 3] # Card Numbers 2, 3, 4
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [1, 3, 2]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [2, 1, 3]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [2, 3, 1]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [3, 1, 2]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [3, 2, 1]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end

    # Rotate Not a Set with 2 attribute 2/1 (1 attributes same)
    it 'should return false' do
      a = [1, 2, 3] # Card Numbers 2, 3, 4
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end

  end
end
