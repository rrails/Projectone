class AddCallDetails < ActiveRecord::Migration
  def change
    add_column :calls, :calldetail, :string
    add_column :calls, :attachment, :text
  end
end
