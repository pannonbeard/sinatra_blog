# frozen_string_literal: true

# Model to handle Posts
class Post < Sequel::Model
  many_to_one :user

  def new_record?
    id.nil?
  end
end
