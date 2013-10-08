class AddUserIdToCommentsTable < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
  end
end
