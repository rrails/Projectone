class UpdateAttendeeTable < ActiveRecord::Migration
  def change
    change_column :attendees, :accepted, :boolean, :default => false
  end

  def down
  end
end
