require 'enumerable_methods'

describe Enumerable do
  let(:array) {[1,2,3,4]}
  
  describe "#my_count" do 
    it "returns a number" do
      expect(array.my_count).to be_instance_of FixedNum
    end
    
    it "returns 0 for an empty array" do
        expect([].my_count).to eq(0)
    end
    
    context "non-enumerable object" do
      it "raises en error if called on a non-enumerable object" do 
        expect("hello".my_count).to raise_error NoMethodError
        expect(nil.my_count).to raise_error NoMethodError
        expect(10.my_count).to raise_error NoMethodError  
      end
    end
    
    context "array has elements" do
      it "returns correct count" do
        expect(array.my_count).to eq(4)
        expect(["value",1,nil]).to eq(3)
      end
    end
    
    context "block given" do
      it "returns count of elements for which the block returns true" do
        expect(array.mycount {|x| x>2}).to eq(2)
      end
    end
  end
  
  describe
