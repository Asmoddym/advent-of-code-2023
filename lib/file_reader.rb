class FileReader
  def self.read(file)
    File.read(file).each_line("\n", chomp: true).to_a
  end
end
