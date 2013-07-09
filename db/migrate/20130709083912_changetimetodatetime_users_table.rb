class ChangetimetodatetimeUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :preferredstarttime
    remove_column :users, :preferredendtime
  end
end
