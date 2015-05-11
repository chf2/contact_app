class CreateGroupMemberships < ActiveRecord::Migration
  def change
    create_table :group_memberships do |t|
      t.integer :contact_group_id, null: false
      t.integer :contact_id, null: false

      t.timestamps null: false
    end
    add_index(:group_memberships, [:contact_group_id, :contact_id], unique: true)
    add_index(:group_memberships, :contact_group_id)
  end
end
