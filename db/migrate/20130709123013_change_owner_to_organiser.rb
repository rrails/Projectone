class ChangeOwnerToOrganiser < ActiveRecord::Migration
  def change
    rename_column :calls, :owner, :organiser
  end
end