# frozen_string_literal: true

require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sprockets'
require 'bcrypt'

require './config/db'

Dir['./app/models/**/*.rb'].sort.each do |file|
  require file
end

Dir['./app/helpers/**/*_helper.rb'].sort.each do |file|
  require file
end

Dir['./app/controllers/**/*_controller.rb'].sort.each do |file|
  require file
end
