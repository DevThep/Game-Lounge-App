class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name
      t.references :game, foreign_key: true

      t.timestamps
    end
    add_index :topics, [:game_id, :created_at]
  end
end
