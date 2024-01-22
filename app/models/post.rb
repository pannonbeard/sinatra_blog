require './config/db'

class Post < Sequel::Model
  def self.find(id)
    self.first(id: id)
  end

  def new_record?
    id == nil
  end
end

class PostMigrationCreateDB
  def create
    DB.create_table :posts do
      primary_key :id
      String :title
      Text :content
    end
  end
end