namespace :app do
  namespace :db do
    desc "Run migrations"
    task :migrate, [:version] do |t, args|
      require "sequel/core"
      Sequel.extension :migration
      version = args[:version].to_i if args[:version]
      Sequel.connect('sqlite://db/blog.sqlite') do |db|
        Sequel::Migrator.run(db, "db/migrations", target: version)
      end
    end

    desc "Drop Databases"
    task :drop do
      File.delete('./db/blog.sqlite')
    end
  end
end