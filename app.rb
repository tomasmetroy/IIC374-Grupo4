# frozen_string_literal: true

$LOAD_PATH << File.join('app')

require 'models/game'

finished_game = false

puts 'Welcome to the game: if you want to leave enter exit'
until finished_game
  input = $stdin.gets.chomp
  puts "Input: #{input}"
  finished_game = true if input == 'exit'
  if input == 'new game'
    puts 'username:'
    username = $stdin.gets.chomp
    puts 'size of the board:'
    size = $stdin.gets.chomp.to_i
    board = Game.new(username, size)
  end
end

puts 'Game  has finish!!!'
