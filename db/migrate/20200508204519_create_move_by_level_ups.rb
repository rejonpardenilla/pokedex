class CreateMoveByLevelUps < ActiveRecord::Migration[6.0]
  def change
    create_table :move_by_level_ups do |t|
      t.integer :level
      t.references :pokemon, null: false, foreign_key: true
      t.references :move, null: false, foreign_key: true

      t.timestamps
    end
  end
end
