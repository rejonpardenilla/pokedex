module CanLearnMovesWithLevelUp
  extend ActiveSupport::Concern

  included do
    has_many :move_by_level_ups
    has_many :moves_learnt_by_level_up, through: :move_by_level_ups, source: :move
  end
end
