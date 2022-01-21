# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.string :location, null: false
      t.date :starttime, null: false
      t.date :endtime
      t.string :organizeremail
      t.string :organizertelegram
      t.string :link

      t.timestamps
    end
  end
end
