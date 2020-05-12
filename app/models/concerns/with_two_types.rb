module WithTwoTypes
  extend ActiveSupport::Concern

  included do
    POSSIBLE_TYPES = [
      'normal', 'fighting', 'flying', 'poison', 'ground',
      'rock', 'bug', 'ghost', 'steel', 'fire', 'grass', 'water',
      'electric', 'psychic', 'ice', 'dragon', 'dark', 'fairy',
    ].freeze
    POSSIBLE_TYPES_HASH = Hash[POSSIBLE_TYPES.collect { |type| [type, type] }].freeze

    enum type_1: POSSIBLE_TYPES_HASH, _prefix: true
    enum type_2: POSSIBLE_TYPES_HASH, _prefix: true
  
    validates :type_1, inclusion: { in: POSSIBLE_TYPES }, allow_nil: false
    validates :type_2, inclusion: { in: POSSIBLE_TYPES }, allow_nil: true

    def types
      [self.type_1, self.type_2].compact
    end
  end
end