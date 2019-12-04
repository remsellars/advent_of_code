require "day4"

RSpec.describe Day4 do

  describe ".never_decreases?" do
    specify "12345 returns true" do
      expect(Day4.never_decreases?(12345)).to eq true
    end

    specify "11122 returns true" do
      expect(Day4.never_decreases?(11122)).to eq true
    end

    specify "54321 returns false" do
      expect(Day4.never_decreases?(54321)).to eq false
    end

    specify "12341 returns false" do
      expect(Day4.never_decreases?(12341)).to eq false
    end
  end

  describe "part1" do
    describe ".has_repetition?" do
      specify "12344 returns true" do
        expect(Day4.has_repetition?(12344)).to eq true
      end

      specify "11111 returns true" do
        expect(Day4.has_repetition?(11111)).to eq true
      end

      specify "12345 returns false" do
        expect(Day4.has_repetition?(12345)).to eq false
      end
    end

    describe ".valid_part1?" do
      specify "111111 meets these criteria (double 11, never decreases)" do
        expect(Day4.valid_part1?(111111)).to eq true
      end

      specify "223450 does not meet these criteria (decreasing pair of digits 50)" do
        expect(Day4.valid_part1?(223450)).to eq false
      end

      specify "123789 does not meet these criteria (no double)" do
        expect(Day4.valid_part1?(123789)).to eq false
      end
    end

    specify "solution" do
      expect(Day4.part1).to eq 544
    end
  end

  describe "part2" do
    describe ".has_double?" do
      specify "12344 returns true" do
        expect(Day4.has_double?(12344)).to eq true
      end

      specify "11122 returns true" do
        expect(Day4.has_double?(11122)).to eq true
      end

      specify "11111 returns false" do
        expect(Day4.has_double?(11111)).to eq false
      end

      specify "12345 returns false" do
        expect(Day4.has_double?(12345)).to eq false
      end

      specify "844125 returns true" do
        expect(Day4.has_double?(844125)).to eq true
      end

      specify "846227 returns true" do
        expect(Day4.has_double?(846227)).to eq true
      end

      specify "446778 returns true" do
        expect(Day4.has_double?(446778)).to eq true
      end

    end

    describe ".valid_part2?" do
      specify "112233 meets these criteria because the digits never decrease and all repeated digits are exactly two digits long" do
        expect(Day4.valid_part2?(112233)).to eq true
      end

      specify "123444 no longer meets the criteria (the repeated 44 is part of a larger group of 444)" do
        expect(Day4.valid_part2?(123444)).to eq false
      end

      specify "111122 meets the criteria (even though 1 is repeated more than twice, it still contains a double 22)" do
        expect(Day4.valid_part2?(111122)).to eq true
      end
    end

    specify "solution" do
      expect(Day4.part2).to eq 334
    end
  end
end

