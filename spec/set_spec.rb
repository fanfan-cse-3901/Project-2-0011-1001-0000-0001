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
    # Card Numbers 1, 2, 3
    # 1: one, diamond, red, solid
    # 2: one, squiggle, red, solid
    # 3: one, oval, red, solid
    it 'should return true' do
      a = [0, 1, 2]
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
    # Card Numbers 1, 29, 57
    # 1: one, diamond, red, solid
    # 29: two, squiggle, red, solid
    # 57: three, oval, red, solid
    it 'should return true' do
      a = [0, 28, 56]
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
    # Card Numbers 1, 14, 27
    # 1: one, diamond, red, solid
    # 14: one, squiggle, green, striped
    # 27: one, oval, purple, open
    it 'should return true' do
      a = [0, 13, 26]
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
    # Card Numbers 1, 2, 6
    # 1: one, diamond, red, solid
    # 2: one, squiggle, red, solid
    # 6: one, oval, red, striped
    it 'should return false' do
      a = [0, 1, 5]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [0, 5, 1]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [1, 0, 5]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [1, 5, 0]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [5, 0, 1]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [5, 1, 0]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end

    # Rotate Not a Set with 2 attribute 2/1 (1 attributes same)
    # Card Numbers 28, 29, 40
    # 28: two, diamond, red, solid
    # 29: two, squiggle, red, solid
    # 42: two, oval, green, striped
    it 'should return false' do
      a = [27, 28, 41]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [27, 41, 28]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [28, 27, 41]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [28, 41, 27]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [41, 27, 28]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [41, 28, 27]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end

    # Rotate Not a Set with 2 attribute 2/1 (0 attributes same)
    # Card Numbers 1, 29, 69
    # 1:   one, diamond, red, solid
    # 29: two, squiggle, red, solid
    # 69: three, oval, green, striped
    it 'should return false' do
      a = [0, 28, 68]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [0, 68, 28]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [28, 0, 68]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [28, 68, 0]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [68, 0, 28]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [68, 28, 0]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end

    # Rotate Not a Set with 3 attribute 2/1 (1 attributes same)
    # Card Numbers 2, 10, 14
    # 2: one, squiggle, red, solid
    # 10: one, diamond, green, solid
    # 14: one, squiggle, green, striped
    it 'should return false' do
      a = [1, 9, 13]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [1, 13, 9]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [9, 1, 13]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [9, 13, 1]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [13, 1, 9]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [13, 9, 1]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end

    # Rotate Not a Set with 3 attribute 2/1 (0 attributes same)
    # Card Numbers 4, 37, 56
    # 4: one, diamond, red, striped
    # 37: two, diamond, green, solid
    # 56: three, squiggle, red, solid
    it 'should return false' do
      a = [3, 36, 55]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [3, 55, 36]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [36, 3, 55]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [36, 55, 0]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [55, 3, 36]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [55, 36, 3]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end

    # Rotate Not a Set with 4 attribute 2/1 (0 attributes same)
    # Card Numbers 9, 23, 54
    # 9: one, oval, red, open
    # 23: one, squiggle, purple, striped
    # 54: two, oval, purple, open
    it 'should return false' do
      a = [8, 22, 53]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [8, 53, 22]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [22, 8, 53]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [22, 53, 8]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [53, 8, 22]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      a = [53, 22, 8]
      is_set = SetVerify.is_set?(a)
      expect(is_set).to eq false
    end
  end
end
