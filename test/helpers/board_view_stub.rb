# frozen_string_literal: true

require './lib/observer/observer'

# Class to implement object that manage the view of the board
class BoardViewStub < Observer
  def initialize
    super
    @board_printed = false
    @options_printed = false
    @input_requested = false
    @notified_invalid_action = false
    @game_over_called = false
  end

  def update(board_model)
    print_board(board_model)
  end

  def print_board(_board_model)
    @board_printed = true
  end

  def print_options
    @options_printed = true
  end

  def request_input
    @input_requested = true
    [1, 1]
  end

  def notify_invalid_action
    @notified_invalid_action = true
  end

  def game_over
    @game_over_called = true
  end

  def clean
    # Clears the terminal.
    "\e[H\e[2J"
  end

  def options_string
    "Elige una coordenada indicándola con el siguiente formato: <#Fila,#Columna>\n"
  end

  def congratulations_string
    'Felicidades, ganaste! \nHas logrado destapar todas las casillas sin haberte topado con ninguna bomba.'
  end

  def game_over_string
    "Has encontrado una bomba! Game Over :(\n"
  end

  def congratulate
    congratulations_string
  end

  def board_was_printed
    @board_printed
  end

  def options_were_printed
    @options_printed
  end

  def input_was_requested
    @request_input
  end

  def invalid_action_was_notified
    @notified_invalid_action
  end

  def game_over_was_called
    @game_over_called
  end
end
