# frozen_string_literal: true

require_relative 'test_helper'
require_relative 'helpers/board_view_stub'
require_relative '../lib/board_model'
require 'test/unit'

class BoardTest < Test::Unit::TestCase
  def setup
    @board = Board.new(test: true)
  end

  def test_mark_board_incorrectly
    expected = Array.new(5) { Array.new(5, ' ') }
    [-1, 0, 5].each do |row|
      [-1, 0, 5].each do |column|
        unless row == column && row.zero?
          @board.mark(row, column, notify_observer: false)
          assert_true(@board.equal(expected)) unless row == column && row.zero?
        end
      end
    end
  end

  def test_mark_board_correctly
    expected = [%w[0 0 0 0 0],
                %w[0 1 1 1 0],
                ['0', '1', ' ', '2', '1'],
                ['0', '1', '2', ' ', ' '],
                ['0', '0', '1', ' ', ' ']]
    @board.mark(0, 0, notify_observer: false)
    assert_true(@board.equal(expected))
  end

  def test_notify_correctly
    view = BoardViewStub.new
    @board.add_observer(view)
    @board.mark(0, 0)
    assert_true(view.board_was_printed)
  end

  def test_symbol_at_function
    unmark_symbol = @board.symbol_at(0, 0)
    assert_equal(unmark_symbol, ' ')
    @board.mark(0, 0, notify_observer: false)
    mark_symbol = @board.symbol_at(0, 0)
    assert_equal(mark_symbol, '0')
  end

  def test_fill_board_with_bombs
    normal_board = Board.new
    bombs_count = 0
    (0..normal_board.height - 1).each do |row|
      (0..normal_board.width - 1).each do |column|
        bombs_count += 1 if normal_board.symbol_at(row, column) == '*'
      end
    end
  end

  def test_win
    assert_false(@board.winner)
    @board.mark(0, 0)
    @board.mark(3, 4)
    @board.mark(4, 3)
    assert_true(@board.winner)
  end

  def test_bomb_explosion
    assert_true(@board.bomb_explosion(4, 4))
  end
end
