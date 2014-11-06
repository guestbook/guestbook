class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :github_login,      :null => false
      t.integer :github_id,         :null => false
      t.string  :github_avatar_url, :null => false
      t.string  :access_token,      :null => false
      t.boolean :admin,             :null => false

      t.timestamps
    end
  end
end
