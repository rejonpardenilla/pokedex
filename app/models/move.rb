class Move < ApplicationRecord
  has_many :move_by_level_ups
  has_many :pokemons, through: :moves_by_level_ups
end
