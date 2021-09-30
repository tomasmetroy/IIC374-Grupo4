# frozen_string_literal: true

require 'matrix'

# Class to manage business info of a board instance
class BoardController
  def initialize(board_model, board_view)
    @model = board_model
    @view = board_view
  end

  def start_game
    print_board

    loop do
      request_input
    end
  end

  def print_board
    @view.print_board(@model)
  end

  def request_input
    @view.print_options

    row, col = $stdin.gets.split(',')
    row, col = validate_parameter(row, col)

    select(row, col)
  end

  # TODO: validates parameters (two integers)
  def validate_parameter(row, col)
    [row.to_i, col.to_i]
  end

  def select(row, col)
    valid_action = @model.mark(row, col)
    @view.notify_invalid_action unless valid_action

    if @model.box_with_bomb(row, col)
      @view.game_over
      exit(0)
    end

    return unless @model.winner

    @view.congratulate
    exit(0)
  end
end
