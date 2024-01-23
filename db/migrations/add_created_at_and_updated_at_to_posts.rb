class AddCreatedAtAndUpdatedAtToPosts
  def change
    DB.add_column :posts, :created_at, :datetime
    DB.add_column :posts, :updated_at, :datetime
  end
end