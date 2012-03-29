#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

task :cucumber do
  sh "rake db:migrate"
  sh "rake db:test:prepare"
end

Rottenpotatoes::Application.load_tasks

task :cucumber do
  sh "rake db:migrate"
  sh "rake db:test:prepare"
end
