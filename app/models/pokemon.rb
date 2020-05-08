class Pokemon < ApplicationRecord
  POSSIBLE_TYPES = [
    'normal', 'fighting', 'flying', 'poison', 'ground',
    'rock', 'bug', 'ghost', 'steel', 'fire', 'grass', 'water',
    'electric', 'psychic', 'ice', 'dragon', 'dark', 'fairy',
  ].freeze
  POSSIBLE_TYPES_HASH = Hash[POSSIBLE_TYPES.collect { |type| [type, type] }].freeze

  has_one_attached :sprite
  has_many :move_by_level_ups
  has_many :moves_learnt_by_level_up, through: :move_by_level_ups, source: :move

  enum type_1: POSSIBLE_TYPES_HASH, _prefix: true
  enum type_2: POSSIBLE_TYPES_HASH, _prefix: true

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
