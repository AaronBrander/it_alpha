class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.integer :number_of_likes
      t.integer :number_of_dislikes
      t.integer :state
      t.integer :board_id

      t.timestamps
    end

    add_index :ideas, :board_id, unique: true
  end
end
