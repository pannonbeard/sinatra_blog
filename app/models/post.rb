# frozen_string_literal: true

# Model to handle Posts
class Post < Sequel::Model
  def new_record?
    id.nil?
  end
end
