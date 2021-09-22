# frozen_string_literal: true

require 'matrix'
require_relative './observer/observer'

# Class to implement object that manage the view of the board
class BoardView < Observer
  def update(board_model)
    clean
    print_board(board_model)
  end

  # def print
  #   # matrix.each do |row|
  #   #   puts row
  #   # end
  #   # pp matrix
  #   matrix.each do |r|
  #     puts r.each { |p| p }.join(" ")
  #   end
  # end

  def print_board(board_model)
    print '  '
    (0..board_model.width-1).each do |col_number|
      print col_number
      print '|' if (col_number < board_model.width)
    end
    # print "|\n"
    puts
    print_row(board_model)
    $stdout.flush
  end

  def print_row(board_model)
    (0..board_model.height-1).each do |row_number|
      print row_number
      (0..board_model.width-1).each do |matrix_col|
        print '|'
        print board_model.symbol_at(row_number, matrix_col)
      end
      print "|\n"
    end
  end

  def clean
    # TO DO
  end

  def options_string
    "Elige una coordenada indicándola con el siguiente formato: <#Fila,#Columna>\n"
  end

  def print_options
    print options_string
  end

  def congratulations_string
    'Felicidades, ganaste! \nHas logrado destapar todas las casillas sin haberte topado con ninguna bomba.'
  end

  def congratulate
    clean
    print congratulations_string
  end

  def game_over_string
    "Has encontrado una bomba! Game Over :(\n"
  end

  def game_over
    clean
    print game_over_string
  end
end
