class RemoveUserAccessToken < ActiveRecord::Migration
  def change
    remove_column :users, :access_token
  end
end
