require 'bundler'
Bundler.setup

require 'rake'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.rspec_opts = '-c -f n'
  spec.pattern = FileList['spec/**/*_spec.rb']
end

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:cucumber)

task default: [:spec, :cucumber]
