class Pokemon < ApplicationRecord
  POSSIBLE_TYPES = [
    'normal', 'fighting', 'flying', 'poison', 'ground',
    'rock', 'bug', 'ghost', 'steel', 'fire', 'grass', 'water',
    'electric', 'psychic', 'ice', 'dragon', 'dark', 'fairy',
  ]

  enum type_1: POSSIBLE_TYPES, _prefix: true
  enum type_2: POSSIBLE_TYPES, _prefix: true

  validates :type_1, inclusion: { in: POSSIBLE_TYPES }, allow_nil: false
  validates :type_2, inclusion: { in: POSSIBLE_TYPES }, allow_nil: true

  def types
    [self.type_1, self.type_2].compact
  end
end
