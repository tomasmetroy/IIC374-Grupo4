# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/observer/observer'
require 'test/unit'

class ObserverTest < Test::Unit::TestCase
  def setup
    @observer = Observer.new
  end

  def test_update_observer
    board = %w[0 0 0]
    error_message = "Observer has not implemented method 'update'"
    exception = assert_raises NotImplementedError do
      @observer.update(board)
    end
    assert_equal(error_message, exception.message)
  end
end
