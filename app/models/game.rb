# frozen_string_literal: true

$LOAD_PATH << File.join('app/models')
require 'board'

# Class that contains game info
class Game
  def initialize(username, size)
    @username = username
    @board = Board.new(size)
    @board.print
  end
end
