module WithPokemonAbilities
  extend ActiveSupport::Concern

  included do
    def total
      self.hp + self.attack + self.defense + self.special_attack + self.special_defense + self.speed
    end
  end
end
