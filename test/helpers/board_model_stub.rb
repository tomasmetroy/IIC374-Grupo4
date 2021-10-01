# frozen_string_literal: true

require './lib/observer/observable'

class BoardModelStub < Observable
  def initialize
    super
    @marked = false
    @box_with_bomb_checked = false
    @winner_checked = false
  end

  def mark(row, col)
    @marked = true
    row.to_i + col.to_i < 4
  end

  def box_with_bomb(row, col)
    @box_with_bomb_checked = true
    row.to_i + col.to_i < 3
  end

  def winner
    @winner_checked = true
  end

  def mark_was_called
    @marked
  end

  def box_with_bomb_was_called
    @box_with_bomb_checked
  end

  def winner_was_called
    @winner_checked
  end
end
