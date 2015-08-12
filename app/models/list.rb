class List < ActiveRecord::Base
  belongs_to :board
  default_scope -> { order(created_at: :desc) }
  validates :board_id, presence: true
  validates :title, presence: true, length: { maximum: 200 }
end
