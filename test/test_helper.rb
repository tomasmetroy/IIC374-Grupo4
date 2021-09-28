# frozen_string_literal:true

require 'simplecov'

SimpleCov.start do
  add_filter 'stub'
  add_filter 'view'
  add_filter 'main'
  add_group('Observer', 'lib/observer')
  add_group('Model', 'lib/board_model.rb')
  add_group('Controller', 'lib/board_controller.rb')
  # add_filter 'observer.rb'
end
puts 'SimpleCov started successfully!'
