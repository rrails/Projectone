class CreateTables < ActiveRecord::Migration
  def change
    create_table:users do |t|
      t.string :name
      t.string :location
      t.time :preferredstarttime
      t.time :preferredendtime
      t.timestamps
    end

    create_table :calls do |t|
      t.string :subject
      t.string :description
      t.string :owner
      t.date :date
      t.time :time
      t.timestamps
    end

    create_table :attendes do |t|
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
