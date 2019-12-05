require "intcode"

RSpec.describe Intcode do

  describe "Day 2 specs" do

    specify "1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2)" do
      intcode = Intcode.new([1,0,0,0,99])
      expect(intcode.run).to eq [2,0,0,0,99]
    end

    specify "2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6)" do
      intcode = Intcode.new([2,3,0,3,99])
      expect(intcode.run).to eq [2,3,0,6,99]
    end

    specify "2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801)" do
      intcode = Intcode.new([2,4,4,5,99,0])
      expect(intcode.run).to eq [2,4,4,5,99,9801]
    end

    specify "1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99 (3 * 2 = 6)" do
      intcode = Intcode.new([1,1,1,4,99,5,6,0,99])
      expect(intcode.run).to eq [30,1,1,4,2,5,6,0,99]
    end
  end

  describe "Day 4 specs" do
    # specify "1002,4,3,33" do
    #   intcode = Intcode.new([1002,3,3,4,33])
    #   expect(intcode.run).to eq [1002,3,3,33,99]
    # end

  end

end
