# frozen_string_literal: true

# Class to implement observer object in Observer Design Pattern
class ObserverStub
  def initialize
    @updated = false
  end

  def update(_board)
    @updated = true
  end

  def was_updated
    @updated
  end
end
