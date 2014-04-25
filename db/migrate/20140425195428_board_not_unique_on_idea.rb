class BoardNotUniqueOnIdea < ActiveRecord::Migration
  def change
  	remove_index :ideas, :board_id
  	add_index :ideas, :board_id
  end
end
