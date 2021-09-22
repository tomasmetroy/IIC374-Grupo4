# frozen_string_literal: true

require_relative './observer/observable'
require 'matrix'

# Board class that inherets from Observable class
class Board < Observable
  def initialize
    super

    @height = 6  # TODO: ask the user which heigth (s)he wants
    @width = 6  # TODO: ask the user which width (s)he wants
    @bombs = 12  # TODO: ask the user for difficulty level

    # Indicates if the box is visible for the player or not.
    @state_matrix = Array.new(@heigth) {Array.new(@width, '0')}

    # Indicates the type of the box (may be unknown for the player).
    @hidden_matrix = Array.new(@height) {Array.new(@witdh, '-')}

    fill_board
  end

  def fill_board
    # Fills the board with bombs and numbers indicating how many bombs
    # there are surrounding that square.
    fill_board_with_bombs
    fill_board_with_numbers
  end

  def fill_board_with_bombs
    # [*May take a long while because of randomness.]
    total_bombs = 0
    while total_bombs < @bombs
      row = rand(@height)
      column = rand(@width)

      if @hidden_matrix[row][column] != '*'
        @hidden_matrix[row][column] = '*'
        total_bombs += 1
      end
    end
  end

  def fill_board_with_numbers
    (0..@heigth).each do |row|
      (0..@width).each do |column|
        bombs_surrounding = bombs_in_surroundings(row, col)
        if @hidden_matrix[row][column] != '*'
          @hidden_matrix[row][column] = bombs_surrounding
        end
      end
    end
  end

  def bombs_in_surroundings(row, col)
  end

  def symbol_at(row, column)
    if @state_matrix[row][column] === 1
      @hidden_matrix[row][column]
    else
      ' '
    end
  end

  def mark(row, column)
    if @state_matrix[row][column] === '0'
      @state_matrix[row][column] = '1'
    else
      print 'Elige una nueva posición, dado que la elegida no es una posición correcta'
    end
    notify_all
  end

  def winner
  end

  def bomb_explosion
  end
end
