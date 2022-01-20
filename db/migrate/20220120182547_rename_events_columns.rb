# frozen_string_literal: true

class RenameEventsColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :starttime, :start_time
    rename_column :events, :endtime, :end_time
    rename_column :events, :organizeremail, :organizer_email
    rename_column :events, :organizertelegram, :organizer_telegram
  end
end
