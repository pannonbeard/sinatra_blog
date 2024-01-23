class MigrationSetup
  def create
    DB.create_table :migrations do
      primary_key :id
      String :migration_name
    end
  end
end