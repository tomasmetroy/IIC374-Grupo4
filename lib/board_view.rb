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
    (0..5).each do |col_number|
      print col_number
      print '|' if col_number < 5
    end
    print "|\n"
    print_row(board_model)
    $stdout.flush
  end

  def print_row(board_model)
    (0..5).each do |row_number|
      print row_number
      (0..5).each do |matrix_col|
        print '|'
        print board_model.symbol_at(row_number, matrix_col)
      end
      print "|\n"
    end
  end

  def clean
    # TODO
  end

  def print_options
    print "Elige una coordenada indicándola con el siguiente formato: <#Fila,#Columna>\n"
  end

  def congratulate
    clean
    print 'Felicidades, Ganaste!! Haz logrado destapar todas las casillas sin haberte topado con ninguna bomba'
  end

  def game_over
    clean
    print "Haz encontrado una bomba! Game Over :(\n"
  end
end
