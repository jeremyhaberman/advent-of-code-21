require 'rubocop/rake_task'

task default: %w[test]

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'test/**/*.rb']
  task.fail_on_error = false
  task.options = ['--auto-correct']
end

task :day1 do
  ruby 'lib/day/1/sonar_sweeper.rb'
end

task :test do
  ruby 'test/day/1/sonar_sweep_test.rb'
  ruby 'test/day/2/sonar_sweep_test.rb'
end