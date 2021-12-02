require 'rubocop/rake_task'

task default: %w[lint test]

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'test/**/*.rb']
  task.fail_on_error = false
  task.options = ['--auto-correct']
end

task :run do
end

task :test do
  ruby 'test/day/1/sonar_sweep_test.rb'
end