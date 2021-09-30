# frozen_string_literal: true

#require_relative 'test_helper'
require_relative 'helpers/board_view_stub'
require_relative 'helpers/board_model_stub'
require_relative '../lib/board_controller'
require 'test/unit'

class ControllerTest < Test::Unit::TestCase
  def setup
    @board = BoardModelStub.new
    @view = BoardViewStub.new
    @controller = BoardController.new(@board, @view)
  end

  def test_print_board
    puts '1'
    @controller.print_board
    assert_true(@view.board_was_printed)
  end

  def test_validate_parameter
    puts '2'
    row, col = @controller.validate_parameter('1', '1')
    assert_equal([row, col], [1, 1])
  end

  def test_validate_parameter_incorrectly
    puts '3'
    row, col = @controller.validate_parameter('q', '1')
    assert_not_equal([row, col], [1, 1])
  end

  def test_select_valid_bomb
    puts '4'
    @controller.select(1, 1)
    assert_true(@model.mark_was_called)
    assert_true(@model.box_with_bomb_was_called)
    assert_true(@view.game_over_was_called)
  end

  def test_select_valid_not_bomb
    puts '5'
    @controller.select(2, 1)
    assert_true(@model.mark_was_called)
    assert_true(@model.box_with_bomb_was_called)
    assert_false(@view.game_over_was_called)
  end

  def test_select_invalid
    puts '6'
    @controller.select(2, 2)
    assert_true(@model.mark_was_called)
    assert_true(@view.invalid_action_was_notified)
    assert_false(@model.box_with_bomb_was_called)
    assert_false(@view.game_over_was_called)
  end
end
