require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'tasks/rails'
require 'shell'
require 'fileutils'
require 'activerecord'

desc 'Default: run unit tests.'
task :default => :test

namespace :test_unit do
  desc "runs the test::unit based tests in webrat mode"
  task :rails do
    ENV['WEBRAT_INTEGRATION_MODE'] = 'rails'
    Rake::Task['test:integration'].execute
  end

  desc "runs the test::unit based tests in selenium mode"
  task :selenium do
    ENV['WEBRAT_INTEGRATION_MODE'] = 'selenium'
    Rake::Task['test:integration'].execute
  end

  desc "run both selenium and rails mode Test::Unit suites"
  task :all => [:rails, :selenium]
end