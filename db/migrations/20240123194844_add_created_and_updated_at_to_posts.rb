# frozen_string_literal: true

Sequel.migration do
  change do
    add_column :posts, :created_at, :datetime
    add_column :posts, :updated_at, :datetime
  end
end
