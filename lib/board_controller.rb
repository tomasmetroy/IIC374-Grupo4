# frozen_string_literal: true

require 'matrix'

# Class to manage business info of a board instance
class BoardController
  def initialize(board_model, board_view, test: false)
    @model = board_model
    @view = board_view
    @test = test
  end

  def start_game
    print_board

    loop do
      request_input
      break if @test
    end
  end

  def print_board
    @view.print_board(@model)
  end

  def request_input
    @view.print_options

    row, col = @view.request_input
    row, col = validate_parameter(row, col)

    select(row, col)
  end

  # TODO: validates parameters (two integers)
  def validate_parameter(row, col)
    [row.to_i, col.to_i]
  end

  def select_decision(row, col)
    if @model.box_with_bomb(row, col)
      @view.game_over
      exit(0) unless @test
    end

    return unless @model.winner

    @view.congratulate
    exit(0) unless @test
  end

  def select(row, col)
    valid_action = @model.mark(row, col)
    if valid_action
      select_decision(row, col)
    else
      @view.notify_invalid_action
    end
  end
end
