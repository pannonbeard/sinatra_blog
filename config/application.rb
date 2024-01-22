require './config/db'

Dir['./app/models/*.rb'].each do |file|
  require file
end

Dir['./app/controllers/*_controller.rb'].each do |file|
  require file
end