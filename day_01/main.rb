# PART 1

result = @data.sum(0) do |line|
  scan = line.scan(/\d/).values_at(0, -1).join.to_i
end

puts result

# PART 2

numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

# THING LEARNED
#
# ?= in a regex means lookbehind
#
# "oneight".scan(/one|eight/) => ["one"]
# "oneight".scan(/(?=(one|eight))/) => [["one", "eight"]]

result = @data.sum(0) do |line|
  scan = line.scan(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/).flatten

  res = scan.values_at(0, -1).map { |item|
    numbers.include?(item) ? numbers.index(item) + 1 : item
  }.join.to_i

  res
end

puts result
