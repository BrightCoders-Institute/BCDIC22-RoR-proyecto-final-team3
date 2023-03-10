# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

$:.unshift(File.expand_path('./lib', ENV['RAILS_ROOT']))
require_relative "config/application"
require "bundler/setup"


Rails.application.load_tasks

task :seed do
  Railway::RakeTasks.load_tasks
  Rake::Task['db:seed'].invoke
end

