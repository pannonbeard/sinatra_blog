# frozen_string_literal: true

Sequel.migration do
  change do
    add_column :posts, :user_id, :string, null: false
  end
end
