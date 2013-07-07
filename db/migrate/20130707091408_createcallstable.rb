class Createcallstable < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :subject
      t.string :description
      t.string :owner
      t.date :date
      t.time :time
      t.timestamps
    end
  end
end
