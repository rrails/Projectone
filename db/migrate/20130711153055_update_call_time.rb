class UpdateCallTime < ActiveRecord::Migration
  def change
    remove_column :calls, :time
    add_column :calls, :time, :datetime
  end
end
