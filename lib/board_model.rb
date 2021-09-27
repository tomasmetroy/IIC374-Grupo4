# frozen_string_literal: true

require_relative './observer/observable'
require 'matrix'
require 'pp'

# Board class that inherets from Observable class
class Board < Observable
  attr_reader :height, :width, :hidden_matrix

  def initialize(test: false)
    super()
    @test = test
    @height = 5 # TO DO: ask the user which heigth (s)he wants
    @width = 5  # TO DO: ask the user which width (s)he wants
    @bombs = test ? 3 : 6 # TO DO: ask the user for difficulty level

    # Indicates if the box is visible for the player or not.
    @state_matrix = Array.new(@height) { Array.new(@width, '0') }

    # Indicates the type of the box (may be unknown for the player).
    @hidden_matrix = Array.new(@height) { Array.new(@width, '-') }

    fill_board(test)
  end

  def inside_board(row, col)
    if row.negative? || col.negative? || row >= @height
      false
    else
      (col < @width)
    end
  end

  def box_with_bomb(row, column)
    @hidden_matrix[row][column] == '*'
  end

  def fill_board_with_bombs
    # [*May take a long while because of randomness.]
    total_bombs = 0
    while total_bombs < @bombs
      row = rand(@height)
      column = rand(@width)

      next unless @hidden_matrix[row][column] != '*'

      @hidden_matrix[row][column] = '*'
      total_bombs += 1
    end
  end

  def fill_test_board_with_bombs
    @hidden_matrix[@height - 1][@width - 1] = '*'
    @hidden_matrix[@height - 2][@width - 1] = '*'
    @hidden_matrix[@height - 1][@width - 2] = '*'
  end

  def fill_board_with_numbers
    (0..@height - 1).each do |row|
      (0..@width - 1).each do |column|
        bombs_surrounding = bombs_in_surroundings(row, column)
        @hidden_matrix[row][column] = bombs_surrounding.to_s if @hidden_matrix[row][column] != '*'
      end
    end
  end

  def bombs_in_surroundings(row, col)
    bombs_surrounding = 0
    (row - 1..row + 1).each do |row_searched|
      (col - 1..col + 1).each do |col_searched|
        next if (row_searched == row) && (col_searched == col)

        bombs_surrounding += 1 if inside_board(row_searched, col_searched) && box_with_bomb(row_searched, col_searched)
      end
    end
    bombs_surrounding
  end

  def fill_board(test)
    # Fills the board with bombs and numbers indicating how many bombs
    # there are surrounding that square.
    test ? fill_test_board_with_bombs : fill_board_with_bombs
    fill_board_with_numbers
  end

  def symbol_at(row, column)
    # If the box is visible, returns the type of the box. if not, returns a
    # string with a space (simulating non-visibility).
    if @state_matrix[row][column] == '1'
      @hidden_matrix[row][column]
    else
      ' '
    end
  end

  def mark(row, column, notify_observer: true)
    # Changes the state of a box to visible for the player.
    if inside_board(row, column) && @state_matrix[row][column] == '0'
      @state_matrix[row][column] = '1'

      # If a box with number 0 is marked, mark all the surrounding boxes.
      mark_surrounding_boxes(row, column) if @hidden_matrix[row][column] == '0'
    elsif notify_observer
      puts 'Elige una nueva posición, dado que la elegida no es válida.'
    end
    notify_all if notify_observer
  end

  def mark_surrounding_boxes(row, col)
    (row - 1..row + 1).each do |new_row|
      (col - 1..col + 1).each do |new_col|
        next if (new_row == row) && (new_col == col)

        mark(new_row, new_col, notify_observer: false) if inside_board(new_row, new_col)
      end
    end
  end

  def equal(other_board)
    (1..3).each do |i|
      (1..3).each do |j|
        return false if symbol_at(i, j) != other_board[i][j]
      end
    end
    true
  end

  def winner
    count = 0
    (0..@height - 1).each do |row|
      (0..@width - 1).each do |column|
        count += 1 if symbol_at(row, column) == ' '
      end
    end
    count == @bombs
  end

  # def bomb_explosion(row, col)
  #   @hidden_matrix[row][col] == '*'
  # end

  # Print hidden Matrix: function use for debuging
  # def print_hidden
  #   pp @hidden_matrix
  # end
end
