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
  
  describe "#my_all?" do
    context "no block given" do
      it "returns true if no elements are false or nil" do
        expect(array.my_all?).to be true
        expect([].my_all?).to be true
        expect([nil,1,2].my_all?).to be false
        expect([false,false,true].my_all?).to be false
      end
    end
    
    context "block given" do
      it "returns true if the block returns true for all elements" do
        expect(array.my_all? {|x| x>0}).to be true
        expect(array.my_all? {|x| x.even?}).to be false
        expect([nil,false,nil].my_all? {|x| x.nil? || x == false}).to be true
      end
    end
  end
  
  describe "#my_any?" do
    context "no block given" do
      it "returns true if any of the elements are not false or nil" do
        expect(array.my_any?).to be true
        expect([1,2,3,nil]).to be false
      end
    end
    
    context "block given" do
      it "returns true if the block returns true for any of the elements" do
        expect(array.my_any? {|x| x>3}).to be true
        expect(array.my_any? {|x| x<0}).to be false
      end
    end
  end
  
  describe "#my_none?" do
    context "no block given" do
      it "returns false if any of the elements return true" do
        expect(array.my_none?).to be false
        expect([nil,false].my_none?).to be true
      end
    end
    
    context "block given" do
      it "returns false if the block returns true for any element" do
        expect(array.my_none? {|x| x<0}).to be true
        expect{[1,2,3,nil].my_none? {|x| x == nil}).to be false
      end
    end
  end
  
  describe "#my_select" do
    context "no block given" do
      it "returns an instance of an Enumerator" do
        expect(array.my_select).to be_instance_of(Enumerator)
      end
    end
    
    context "block given" do
      it "returns an array object" do
        expect(array.my_select {|x| x}).to be_instance_of(Array)
      end
      
      it "returns all elements for which the block returns true" do
        expect(array.my_select {|x| x>2}).to eq([3,4])
        expect([1,2,false,true,nil,"hello"].my_select).to eq([1,2,true,"hello"])
      end
    end
  end
