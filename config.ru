# frozen_string_literal: true

require './config/application'

map('/assets') do
  # initialize new sprockets environment
  environment = Sprockets::Environment.new

  # append assets paths
  environment.append_path "app/assets/stylesheets"
  environment.append_path "app/assets/javascripts"
  run environment
end

Dir['./app/controllers/*_controller.rb'].each do |file|
  file_base = File.basename(file, '.rb').split('_')[0]
  controller = "#{file_base.capitalize}Controller"
  next if controller == 'ApplicationController'
  next if controller == 'HomeController'

  map("/#{file_base.gsub('_controller', '')}") { run Kernel.const_get(controller) }
end

map('/') { run HomeController }
