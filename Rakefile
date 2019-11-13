# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks


namespace :newsletter do
  desc "Manages newsletter and subs"

  task :send_daily => :environment do
    User.send_newsletters
  end
end

namepace :ping do
  desc "keep heroku server up"

  task :server => :environment do
    puts "ping"
  end
end
