class Day4

  def self.part1
    count = 0
    (356261..846303).each do |n|
      count += 1 if valid_part1?(n)
    end
    count
  end

  def self.part2
    count = 0
    (356261..846303).each do |n|
      count += 1 if valid_part2?(n)
    end
    count
  end

  def self.valid_part1?(number)
    return never_decreases?(number) && has_repetition?(number)
  end

  def self.valid_part2?(number)
    return never_decreases?(number) && has_double?(number)
  end

  def self.never_decreases?(number)
    digits = split_number(number)

    (digits).each_with_index do |n, i|
      next if i == 0
      return false if n < digits[i-1]
    end

    true
  end

  def self.has_repetition?(number)
    digits = split_number(number)

    (digits).each_with_index do |n, i|
      next if i == 0
      return true if n == digits[i-1]
    end
    false
  end

  # not using clone here tripped me up for quite a while. I needed to take a copy
  # of current_group into group so that current_group could be independently modified again
  def self.has_double?(number)
    return false if !has_repetition?(number)

    digits = split_number(number)
    groups = Array.new
    current_group = Array.new

    (digits).each_with_index do |n, i|
      next if i == 0 # skip the first one

      if(n == digits[i-1])
        # if we're at the start of a group, add the previous digit
        current_group.push(digits[i-1]) if current_group.empty?
        # add this digit to our group
        current_group.push(n)
      else
        # we've either got no groupings or we've hit the end of a group
        # if we were in a group, we can add it to groups and clear it
        groups.push(current_group.clone) if current_group.any?
        current_group.clear
      end
    end

    # if the number finishes with a grouping, we need to add it here
    groups.push(current_group.clone) if current_group.any?

    # returns true if any of the groups are exactly 2 long
    return groups.select {|g| g.count == 2 }.any?
  end

  def self.split_number(number)
    number.to_s.split('').map { |digit| digit.to_i }
  end
end