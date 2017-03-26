class Topic < ApplicationRecord
  belongs_to :game
  default_scope -> { order(created_at: :desc) }
  validates :game_id, presence: true
  validates :name, presence: true, length: { maximum: 255 }
end
