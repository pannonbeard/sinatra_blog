require 'fileutils'

namespace :app do
  MIGRATIONS_DIR = 'db/migrations'
  DATABASE = 'db/blog.sqlite'

  namespace :db do
    desc "Run migrations"
    task :migrate, [:version] do |t, args|
      require "sequel/core"
      Sequel.extension :migration
      version = args[:version].to_i if args[:version]
      Sequel.connect("sqlite://#{DATABASE}") do |db|
        Sequel::Migrator.run(db, "db/migrations", target: version)
      end
    end

    desc "Drop Databases"
    task :drop do
      File.delete("./#{DATABASE}")
    end
  end

  namespace :generate do
    desc "generates Migration file with appropriate version"
    # rake db:generate_migration[my_migration_name]
    task :migration, :name do |_, args|
      args.with_defaults(name: 'migration')

      migration_template = <<~MIGRATION
        Sequel.migration do
          change do
            
          end
        end
      MIGRATION

      file_name = "#{Time.now.strftime('%Y%m%d%H%M%S')}_#{args.name}.rb"
      FileUtils.mkdir_p(MIGRATIONS_DIR)

      File.open(File.join(MIGRATIONS_DIR, file_name), 'w') do |file|
        file.write(migration_template)
      end
    end
  end
end