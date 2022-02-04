# frozen_string_literal: true

class AddStateToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :state, :string, null: false, default: 'pending'
  end
end
