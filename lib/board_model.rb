# frozen_string_literal: true

require_relative './observer/observable'
require 'matrix'

# Board class that inherets from Observable class
class Board < Observable
  def initialize
    super
    size = 6
    @state_matrix = Array.new(size) { Array.new(size, '0') }
    @hidden_matrix = Array.new(size) { Array.new(size, '-') }
    @bombs = (size * size / 3).ceil
    fill_board
  end

  def fill_board
    total_bombs = 0
    while total_bombs <= @bombs
      column = rand(0..5)
      row = rand(0..5)
      if @hidden_matrix[column][row] != '*'
        @hidden_matrix[column][row] = '*'
        total_bombs += 1
      end
    end
    # agregar numeros de alrededor en base a las bombas
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

  def winner; end

  def bomb_explosion; end
end
