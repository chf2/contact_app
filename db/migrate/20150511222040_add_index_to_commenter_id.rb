class AddIndexToCommenterId < ActiveRecord::Migration
  def change
    add_index :comments, :commenter_id
  end
end
