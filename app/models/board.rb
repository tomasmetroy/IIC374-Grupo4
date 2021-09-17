# frozen_string_literal: true

require 'pp'


# Board class that contain the board info
class Board
  attr_reader :bombs, :size, :matrix

  def initialize(size)
    @matrix = Array.new(size) { Array.new(size, 'x') }
    @bombs = (size * size / 3).ceil
    @size = size
    fill_board
  end

  def print
    # matrix.each do |row|
    #   puts row
    # end
    # pp matrix
    matrix.each do |r|
      puts r.each { |p| p }.join(" ")
    end
  end

  def fill_board
    total_bombs = 0
    while total_bombs <= bombs
      limit = size - 1
      column = rand(0..limit)
      row = rand(0..limit)
      if matrix[column][row] != 'b'
        matrix[column][row] = 'b'
        total_bombs += 1
      end
    end
  end
end
