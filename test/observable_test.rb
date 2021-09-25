# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/observer/observable'
require 'test/unit'

class ObservableTest < Test::Unit::TestCase
  def setup
    @observable = Observable.new
  end

  def test_add_observer
    observer = ObserverStub.new
    @observable.add_observer(observer)
    assert_equal(@observable.observers_quantity, 1)
  end

  def test_notify_all
    observer = ObserverStub.new
    @observable.add_observer(observer)
    @observable.notify_all
    assert_true(@observable.observers_notify)
  end
end
