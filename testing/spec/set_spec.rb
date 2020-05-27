# frozen_string_literal: true

# File created 05/25/2020 by Kevin Dong
require 'rspec'
require './set_verify.rb'

# Card Object init from Troy Stein's repo
class Card
  attr_accessor :num,:color,:shade,:shape
  def initialize(num,color,shade,shape)
    @num=num
    @color=color
    @shade=shade
    @shape=shape
  end
end
#first test case
#test code for og card
#og.num=1
#og.shape="blank"
#og.shade="blank"
#og.color="blank"
#puts og.num
i=0 #iterator to populate hashmap
j=0 #iterator for number
k=0 #iterator for color
l=0 #iterator for shade
m=0 #iterator for shape
num_A=[1,2,3]
color_A=[1,2,3]#["red","green","purple"]
shade_A=[1,2,3]#["solid","striped","open"]
shape_A=[1,2,3]#["diamond","squiggle","oval"]
cards = Array.new #temporary pointer
#populates the hashmap
#num array
while j <num_A.length
  #color array
  while k<color_A.length
    #shade array
    while l<shade_A.length
      #shape array
      while m<shape_A.length
        #initializes all values
        cards[i] = Card.new(num_A[j],color_A[k],shade_A[l],shape_A[m]) #adds new Card object at a place in array
        i+=1 #adusts index of hash by one.
        m+=1
      end
      l+=1
      m=0
    end
    k+=1
    l=0
  end
  j+=1
  k=0
end
$Deck = cards

# Model Class
class SetG
  include SetVerify
end

# Test Begin
describe SetVerify do
  context 'When testing the SetGame is_set methods' do
    it "should say 'is set' when we call the is_set method" do
      set_vert = SetG.new
      a = []
      message = set_vert.set?
      expect(message).to eq 'is set'
    end

    # Rotate card order Unique Set
    it 'should return true' do
      set_vert = SetG.new
      a = [0, 40, 80]
      # c = 1, n = 1, d = 1, p = 1
      # c = 2, n = 2, d = 2, p = 2
      # c = 3, n = 3, d = 3, p = 3
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      set_vert = SetG.new
      a = [0, 80, 40]
      # c = 1, n = 1, d = 1, p = 1
      # c = 3, n = 3, d = 3, p = 3
      # c = 2, n = 2, d = 2, p = 2
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      set_vert = SetG.new
      a = [40, 0, 80]
      # c = 2, n = 2, d = 2, p = 2
      # c = 1, n = 1, d = 1, p = 1
      # c = 3, n = 3, d = 3, p = 3
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      set_vert = SetG.new
      a = [40, 80, 0]
      # c = 2, n = 2, d = 2, p = 2
      # c = 3, n = 3, d = 3, p = 3
      # c = 1, n = 1, d = 1, p = 1
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      set_vert = SetG.new
      a = [80, 40, 0]
      # c = 3, n = 3, d = 3, p = 3
      # c = 2, n = 2, d = 2, p = 2
      # c = 1, n = 1, d = 1, p = 1
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq true
    end
    it 'should return true' do
      set_vert = SetG.new
      a = [80, 0, 40]
      # c = 3, n = 3, d = 3, p = 3
      # c = 1, n = 1, d = 1, p = 1
      # c = 2, n = 2, d = 2, p = 2
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq true
    end

    # Matching Set
    it 'should return true' do
      set_vert = SetG.new
      a = [1, 2, 3]
      # c = 1, n = 1, d = 1, p = 2
      # c = 1, n = 1, d = 1, p = 3
      # c = 1, n = 1, d = 2, p = 1
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq true
    end

    # Empty
    it 'should return false' do
      set_vert = SetG.new
      a = []
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq false
    end

    # Rotate card order Not a Set
    it 'should return false' do
      set_vert = SetG.new
      a = [1, 80, 4]
      # c = 1, n = 1, d = 1, p = 2
      # c = 3, n = 3, d = 3, p = 3
      # c = 1, n = 1, d = 2, p = 2
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      set_vert = SetG.new
      a = [1, 4, 80]
      # c = 1, n = 1, d = 1, p = 2
      # c = 1, n = 1, d = 2, p = 2
      # c = 3, n = 3, d = 3, p = 3
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      set_vert = SetG.new
      a = [80, 1, 4]
      # c = 3, n = 3, d = 3, p = 3
      # c = 1, n = 1, d = 1, p = 2
      # c = 1, n = 1, d = 2, p = 2
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      set_vert = SetG.new
      a = [80, 4, 1]
      # c = 3, n = 3, d = 3, p = 3
      # c = 1, n = 1, d = 2, p = 2
      # c = 1, n = 1, d = 1, p = 2
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      set_vert = SetG.new
      a = [4, 80, 1]
      # c = 1, n = 1, d = 2, p = 2
      # c = 3, n = 3, d = 3, p = 3
      # c = 1, n = 1, d = 1, p = 2
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq false
    end
    it 'should return false' do
      set_vert = SetG.new
      a = [4, 1, 80]
      # c = 1, n = 1, d = 2, p = 2
      # c = 1, n = 1, d = 1, p = 2
      # c = 3, n = 3, d = 3, p = 3
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq false
    end

    # Not a Set
    it 'should return false' do
      set_vert = SetG.new
      a = [50, 15, 17]
      # c = 3, n = 2, d = 2, p = 3
      # c = 2, n = 1, d = 3, p = 1
      # c = 2, n = 1, d = 3, p = 3
      is_set = SetVerify.is_set(a)
      expect(is_set).to eq false
    end
  end
end
