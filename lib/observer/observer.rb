# frozen_string_literal: true

# Class to implement observer object in Observer Design Pattern
class Observer
  def update(_board)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
