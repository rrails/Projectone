class AddtimetodatetimeUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :preferredstarttime, :datetime
    add_column :users, :preferredendtime, :datetime
  end
end
