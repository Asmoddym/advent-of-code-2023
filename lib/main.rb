require './lib/file_reader.rb'
require 'pry'

@data = FileReader.read("./#{ARGV[0]}/input.txt")

load "./#{ARGV[0]}/main.rb"
