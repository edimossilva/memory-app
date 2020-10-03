class AddIndexToUniquePropertiesByRubocop < ActiveRecord::Migration[6.0]
  def change
    add_index "memories", ["key"], unique: true
    add_index "users", ["username"], unique: true
  end
end
