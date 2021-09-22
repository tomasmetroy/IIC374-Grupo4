# frozen_string_literal: true

require 'matrix'

# Class to manage business info of a board instance
class BoardController
  def initialize(board_model, board_view)
    @model = board_model
    @view = board_view
  end

  def print_board
    @view.clean
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
    @model.mark(row, col)
    if @model.winner
      @view.congratulate
    elsif @model.bomb_explosion
      @view.gameOver
    else
      request_input
    end
    @view.clean
  end
end
