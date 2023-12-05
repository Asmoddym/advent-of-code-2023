#
# PART 1
#


def number_is_adgacent_to_symbol?(number, offset, y)
  line = @data[y]
  x = offset + line[offset..].index(number)

  previous_cell = x == 0 ? x : x - 1
  next_cell = x + number.size
  next_cell -= 1 if next_cell == line.size

  if y > 0
    return true if @data[y - 1][previous_cell..next_cell].match(/[^.\d]/)
  end

  return true if line[previous_cell].match(/[^.\d]/) || line[next_cell].match(/[^.\d]/)

  if y < @data.size - 1
    return true if @data[y + 1][previous_cell..next_cell].match(/[^.\d]/)
  end
end


def part_1
  results = []

  @data.each_with_index do |line, y|
    numbers = line.scan(/\d+/)

    offset = 0
    numbers.each do |number|
      results << number if number_is_adgacent_to_symbol?(number, offset, y)

      offset += line[offset..].index(number) + number.size
    end
  end

  results.map(&:to_i).sum
end


#
# PART 2
#


def gear_ratio_for_gear_coordinates(x, y)


  # line = @data[y]

  # previous_cell = x == 0 ? x : x - 1
  # next_cell = x + 1
  # next_cell -= 1 if next_cell == line.size
  # gears = []

  # if y > 0
  #   gears << @data[y - 1][previous_cell..next_cell].scan(/\d/)
  # end

  # gears << line[previous_cell].scan(/\d/)
  # gears << line[next_cell].scan(/\d/)

  # if y < @data.size - 1
  #   gears << @data[y + 1][previous_cell..next_cell].scan(/\d/)
  # end

  # binding.pry

  # gears.size == 2 ? gears.map(&:to_i).reduce(&:*) : nil
end

def part_2
  results = []

  @data.each_with_index do |line, y|
    x = 0
    line.scan("*").each do |_|
      x += line[x..].index("*")

      results << gear_ratio_for_gear_coordinates(x, y)
    end
  end

  results.compact.map(&:to_i).sum
end

puts part_1
puts part_2
