class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :board_id
      t.integer :user_id
      t.boolean :is_owner
      t.boolean :is_admin
      t.integer :state

      t.timestamps
    end

    add_index :memberships, :board_id
    add_index :memberships, :user_id
    add_index :memberships, [:board_id, :user_id], unique: true
  end
end
