# frozen_string_literal: true

require_relative 'test_helper'
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
                %w[0 0 0 0 0],
                %w[0 0 0 1 1],
                ['0', '0', '1', '3', ' '],
                ['0', '0', '1', ' ', ' ']]
    @board.mark(0, 0, notify_observer: false)
    assert_true(@board.equal(expected))
  end
end
