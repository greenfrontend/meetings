# frozen_string_literal: true

class AddTypeColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string, null: false, default: 'User'
  end
end
