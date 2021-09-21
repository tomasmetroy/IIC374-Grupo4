# frozen_string_literal: true

class Observer
    def update(board)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
end
