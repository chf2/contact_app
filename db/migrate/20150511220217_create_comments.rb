class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
    add_index(:comments, :commentable_id)
  end
end
