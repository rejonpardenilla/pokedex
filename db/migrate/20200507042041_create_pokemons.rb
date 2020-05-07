class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed
      t.integer :generation
      t.boolean :legendary
      t.boolean :mega
      t.string :type_1
      t.string :type_2
      t.integer :pokedex_identifier

      t.timestamps
    end
  end
end
