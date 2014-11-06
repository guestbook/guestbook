class RemoveUserSpecial < ActiveRecord::Migration
  def change
    remove_column :users, :special
  end
end
