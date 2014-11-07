class RemovePostDefaultUser < ActiveRecord::Migration
  def change
    change_column_default(:posts, :user_id, nil) 
  end
end
