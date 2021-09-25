# frozen_string_literal: true

require 'rubocop/rake_task'

task default: %w[lint test]

task :test do
  ruby 'test/board_model_test.rb'
  ruby 'test/board_controller_test.rb'
  ruby 'test/observer_test.rb'
  ruby 'test/observable_test.rb'
end

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'test/**/*.rb', 'test/helpers/**/*.rb']
  task.fail_on_error = false
end
