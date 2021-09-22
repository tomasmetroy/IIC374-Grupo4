# frozen_string_literal: true

require_relative './observer/observable'
require 'matrix'

# Board class that inherets from Observable class
class Board < Observable
  def initialize
    super

    @height = 6
    @width = 6
    @bombs = 12

    # EXPLAIN
    @state_matrix = Array.new(size) {Array.new(size, '0')}

    # EXPLAIN
    @hidden_matrix = Array.new(size) {Array.new(size, '-')}

    fill_board_with_bombs
  end

  def fill_board_with_bombs
    total_bombs = 0
    while total_bombs < @bombs
      column = rand(@size)
      row = rand(@size)

      if @hidden_matrix[row][column] != '*'
        @hidden_matrix[row][column] = '*'
        total_bombs += 1
      end
    end
    # agregar numeros de alrededor en base a las bombas
  end

  def fill_board_with_numbers

  end

  def symbol_at(row, column)
    if @state_matrix[row][column] == 1
      @hidden_matrix[row][column]
    else
      ' '
    end
  end

  def mark(row, column)
    if @state_matrix[row][column] == '0'
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
