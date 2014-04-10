class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :idea_id
      t.integer :user_id
      t.boolean :has_voted
      t.boolean :has_joined

      t.timestamps
    end

    add_index :relationships, :idea_id
    add_index :relationships, :user_id
  end
end
