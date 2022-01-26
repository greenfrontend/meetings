# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: { unique: true }, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
