class AddApprovedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :approved, :boolean, null: false, default: false
  end
end
