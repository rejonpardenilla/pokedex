class ChangeMoveTypeColumnToPokemonType < ActiveRecord::Migration[6.0]
  def change
    rename_column :moves, :type, :pokemon_type
  end
end
