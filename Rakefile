require "bundler/gem_tasks"
require "rspec/core/rake_task"

desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |t|
   t.ruby_opts = %w[-w]
end

task :default => :spec