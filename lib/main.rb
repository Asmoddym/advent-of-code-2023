require './lib/file_reader.rb'
require 'pry'

@data = FileReader.read("./day_01/input.txt")

load "./#{ARGV[0]}/main.rb"
