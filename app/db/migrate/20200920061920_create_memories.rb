# frozen_string_literal: true

class CreateMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :memories do |t|
      t.string :key
      t.string :value
      t.boolean :visibility

      t.timestamps
    end
  end
end
