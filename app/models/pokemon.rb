class Pokemon < ApplicationRecord
  include WithTwoTypes, WithSpecialPokemonScopes, WithPokemonAbilities
  include CanLearnMovesWithLevelUp

  has_one_attached :sprite

  validates :name, presence: true

  def self.random_sample
    random_id = rand(self.count)
    self.find_by!(id: random_id)
  end
end
