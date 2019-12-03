require "day2"

module Day2
  RSpec.describe Intcode do
    
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

    specify "part 1" do
      expect(Intcode.part1).to eq 2894520
    end

    specify "part 2" do
        expect(Intcode.part2).to eq 9342
      end
  end
end
