@games = @data.each_with_object([]) do |line, games|
  match = line.match(/Game (?<game_id>\d+): (?<rows>(\d+ (red|green|blue)(, )?+(; )?)+)/)

  games << {
    id: match[:game_id], 
    rows: match[:rows].split(";").map do |row|
      match = row.match(/(((?<red>\d+) red(, )?|(?<green>\d+) green(, )?|(?<blue>\d+) blue?)(, )?)+/)

      [:red, :green, :blue].to_h { |key| [key, match[key]&.to_i || 0]}
    end
  }
end

def part_1
  bag_configuration = { red: 12, green: 13, blue: 14 }

  @games.map do |game|
    next 0 unless [:green, :blue, :red].all? do |key|
      game[:rows].all? { |row| row[key] <= bag_configuration[key] }
    end

    game[:id].to_i
  end.sum
end

def part_2
  @games.map do |game|
    maxs = [:red, :green, :blue].to_h do |key|
      [key, game[:rows].max_by { |row| row[key] }[key]]
    end

    maxs.values.reduce(&:*)
  end.sum
end

puts part_1
puts part_2
