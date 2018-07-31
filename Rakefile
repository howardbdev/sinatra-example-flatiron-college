ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'
# Line 4 implies that the following file exists on your computer:
# (some url within $LOAD_PATH)/sinatra/activerecord/rake.rb

task :console do
  Pry.start
end
