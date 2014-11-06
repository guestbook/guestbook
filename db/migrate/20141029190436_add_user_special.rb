class AddUserSpecial < ActiveRecord::Migration
  def change
    add_column :users, :special, :boolean, null: false, default: false
  end
end
