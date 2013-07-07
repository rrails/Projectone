class Createusertable < ActiveRecord::Migration
  def change
    create_table:users do |t|
      t.string :name
      t.string :location
      t.time :preferredstarttime
      t.time :preferredendtime
      t.timestamps
    end
  end
end
