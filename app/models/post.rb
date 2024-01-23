require './config/db'

class Post < Sequel::Model
  def new_record?
    id == nil
  end
end
