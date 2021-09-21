# frozen_string_literal: true
require_relative './observer/observable'
require 'matrix'

class Board < Observable

  def initialize()
    @state_matrix = Array.new(6) { Array.new(6, '0') }
    @hidden_matrix = Array.new(6) { Array.new(6, '-') }
    @bombs = (6 * 6 / 3).ceil
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
    # agregar números de al rededor en base a las bombas
  end

  def symbolAt(xo,yo)
    if @state_matrix[xo][yo] == 1 
      @hidden_matrix[xo][yo]
    else 
      " "
    end
  end

  def mark(xo, yo)
    if @state_matrix[xo][yo] == '0'
      @state_matrix[xo][yo] = '1'
    else 
      # print "Elige una nueva posición, dado que la elegida no es una posición correcta"
    end
    notifyAll()
  end

  def winner()
    
  end

  def bomb_explosion()
    
  end

end
