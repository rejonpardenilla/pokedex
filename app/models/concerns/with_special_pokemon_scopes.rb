module WithSpecialPokemonScopes
  extend ActiveSupport::Concern

  included do
    scope :non_megas, -> { where mega: false }
    scope :megas, -> { where mega: true }
    scope :non_legendaries, -> { where legendary: false }
    scope :legendaries, -> { where legendary: true }
  end
end
