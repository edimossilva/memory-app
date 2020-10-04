class AddMemoriesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :memories, :user_id, :integer, null: false
    add_index  :memories, :user_id
  end
end
