class Pokemon < ApplicationRecord
  POSSIBLE_TYPES = [
    'normal', 'fighting', 'flying', 'poison', 'ground',
    'rock', 'bug', 'ghost', 'steel', 'fire', 'grass', 'water',
    'electric', 'psychic', 'ice', 'dragon', 'dark', 'fairy',
  ].freeze

  has_one_attached :sprite

  types_hash = Hash[POSSIBLE_TYPES.collect { |type| [type, type] }]
  enum type_1: types_hash, _prefix: true
  enum type_2: types_hash, _prefix: true

  validates :type_1, inclusion: { in: POSSIBLE_TYPES }, allow_nil: false
  validates :type_2, inclusion: { in: POSSIBLE_TYPES }, allow_nil: true
  validates :name, presence: true

  scope :non_megas, -> { where mega: false }
  scope :megas, -> { where mega: true }
  scope :non_legendaries, -> { where legendary: false }
  scope :legendaries, -> { where legendary: true }

  def types
    [self.type_1, self.type_2].compact
  end

  def total
    self.hp + self.attack + self.defense + self.special_attack + self.special_defense + self.speed
  end
end
