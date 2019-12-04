require "day3"

RSpec.describe Path do

  describe "#new" do
  # R8,U5,L5,D3
    specify "R8,U5,L5,D3" do
      path = Path.new("R8,U5,L5,D3")
      expect(path.coordinates.count).to eq 22
    end
  end

end


RSpec.describe Day3 do

  describe ".intersections" do
    specify "R8,U5,L5,D3 and U7,R6,D4,L4 has 2 intersections" do
      path1 = Path.new("R8,U5,L5,D3")
      path2 = Path.new("U7,R6,D4,L4")
      intersections = Day3.intersections(path1, path2)
      puts intersections
      expect(intersections.count).to eq 2
    end
  end

  describe ".closest_intersection" do
    specify "R8,U5,L5,D3 and U7,R6,D4,L4 have their closest intersect at 3,3" do
      path1 = Path.new("R8,U5,L5,D3")
      path2 = Path.new("U7,R6,D4,L4")
      intersection = Day3.closest_intersection(path1, path2)
      puts intersection
      expect(intersection.x).to eq 3
      expect(intersection.y).to eq 3
    end
  end

  describe ".closest_intersection_distance" do
    specify "R8,U5,L5,D3 and U7,R6,D4,L4 = distance 6" do
      path1 = Path.new("R8,U5,L5,D3")
      path2 = Path.new("U7,R6,D4,L4")
      expect(Day3.closest_intersection_distance(path1, path2)).to eq 6
    end

    specify "R75,D30,R83,U83,L12,D49,R71,U7,L72 and U62,R66,U55,R34,D71,R55,D58,R83 = distance 159" do
      path1 = Path.new("R75,D30,R83,U83,L12,D49,R71,U7,L72")
      path2 = Path.new("U62,R66,U55,R34,D71,R55,D58,R83")
      expect(Day3.closest_intersection_distance(path1, path2)).to eq 159
    end

    specify "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51 and U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = distance 135" do
      path1 = Path.new("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51")
      path2 = Path.new("U98,R91,D20,R16,D67,R40,U7,R15,U6,R7")
      expect(Day3.closest_intersection_distance(path1, path2)).to eq 135
    end
  end

  specify ".part1" do
    expect(Day3.part1).to eq 135
  end

end
