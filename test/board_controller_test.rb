# frozen_string_literal: true

require_relative 'test_helper'
require_relative 'helpers/board_view_stub'
require_relative '../lib/board_controller'
require_relative '../lib/board_model'
require 'test/unit'
require 'stringio'

class ControllerTest < Test::Unit::TestCase
  def setup
    @board = Board.new(test: true)
    @view = BoardViewStub.new
    @controller = BoardController.new(@board, @view)
  end

  def test_print_board
    @controller.print_board
    assert_true(@view.board_was_printed)
  end

  def test_validate_parameter
    row, col = @controller.validate_parameter('1', '1')
    assert_equal([row, col], [1, 1])
  end

  def test_validate_parameter_wrong
    row, col = @controller.validate_parameter('q', '1')
    assert_not_equal([row, col], [1, 1])
  end

  def test_request_input
    io = StringIO.new
    io.puts '0,0'
    io.rewind
    $stdin = io
    @controller.request_input
    assert_true(@view.options_were_printed)
    $stdin = STDIN
  end
end
