class Createatendeesstable < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.references :user
      t.references :call
      t.date :meetingdate
      t.date :dateinvited
      t.date :dateofreminder
      t.boolean :accepted
      t.timestamps
    end
  end
end
