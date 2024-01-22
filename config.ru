require './config/application'

Dir['./app/controllers/*_controller.rb'].each do |file|
  file_base = File.basename(file, '.rb').split('_')[0]
  controller = "#{file_base.capitalize}Controller"
  next if controller == 'ApplicationController' 

  puts "required #{file_base}"
  puts "registered /#{file_base.gsub('_controller', '')}"
  map("/#{file_base.gsub('_controller', '')}"){ run Kernel.const_get(controller) }
end

map('/'){ run ApplicationController }