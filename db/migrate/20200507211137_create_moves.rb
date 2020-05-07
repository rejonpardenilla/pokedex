class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.string :type
      t.string :category
      t.string :contest
      t.integer :power_points
      t.integer :power
      t.integer :accuracy_percent
      t.integer :generation

      t.timestamps
    end
  end
end
