namespace :app do
  desc "migrate non migrated files"
  task :migrate do
    require './config/db'
    Dir[File.join('db', 'migrations', '*.rb')].each do |file|
      require File.expand_path(file)

      migration = Kernel.const_get(File.basename(file, '.rb').split('_').collect(&:capitalize).join)

      next unless DB[:migrations].where(migration_name: migration.to_s).count == 0

      migration.new.change

      puts migration
      DB[:migrations].insert({ migration_name: migration.to_s })
    end
  end


  desc "sets up initial db"
  task :db_setup do
    require './config/db'
    require './db/migrations/migration_setup'

    MigrationSetup.new.create

    puts 'Set up db'
    DB[:migrations].insert({ migration_name: 'MigrationSetup' })
  end
end