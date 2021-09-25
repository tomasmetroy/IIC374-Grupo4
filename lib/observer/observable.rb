# frozen_string_literal: true

# Class to implement observable object in Observer Design Pattern
class Observable
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def notify_all
    @observers.each { |observer| observer.update(self) }
  end

  def observers_quantity
    @observers.length
  end

  def observers_notify
    @observers[-1].was_updated
  end
end
