# frozen_string_literal: true

require 'matrix'
require_relative './observer/observer'

# Class to implement object that manage the view of the board
class BoardView < Observer
  def update(board_model)
    # clean
    print_board(board_model)
  end

  def print_board(board_model)
    puts
    print_board_head(board_model)
    print_board_rows(board_model)
  end

  def print_board_head(board_model)
    print '  '
    (0..board_model.width - 1).each do |col_number|
      print col_number
      print '|' if col_number < board_model.width
    end
    puts
  end

  def print_board_rows(board_model)
    (0..board_model.height - 1).each do |row_number|
      print row_number
      (0..board_model.width - 1).each do |matrix_col|
        print '|'
        print board_model.symbol_at(row_number, matrix_col)
      end
      print "|\n"
    end
  end

  def clean
    # Clears the terminal.
    puts "\e[H\e[2J"
  end

  def options_string
    "Elige una coordenada indicándola con el siguiente formato: <#Fila,#Columna>\n"
  end

  def congratulations_string
    "Felicidades, ganaste!\nHas logrado destapar todas las casillas sin haberte topado con ninguna bomba!"
  end

  def game_over_string
    "Has encontrado una bomba! Game Over :(\n"
  end

  def invalid_action_string
    'La posición elegida no es válida.'
  end

  def print_options
    # clean
    puts
    puts options_string
    print '>> '
  end

  def congratulate
    # clean
    puts
    puts congratulations_string
  end

  def game_over
    # clean
    puts
    puts game_over_string
  end

  def notify_invalid_action
    puts
    print invalid_action_string
  end
end
