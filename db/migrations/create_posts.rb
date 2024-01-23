class CreatePosts
  def change
    DB.create_table :posts do
      primary_key :id
      String :title
      Text :content
    end
  end
end