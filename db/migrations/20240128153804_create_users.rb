# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      String :email
      String :password_hash
      String :username
      String :name
    end
  end
end
