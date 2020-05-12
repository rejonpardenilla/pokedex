class Pokemon < ApplicationRecord
  include WithTwoTypes, WithSpecialPokemonScopes, WithPokemonAbilities
  include CanLearnMovesWithLevelUp

  has_one_attached :sprite

  validates :name, presence: true
end
