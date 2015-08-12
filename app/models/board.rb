class Board < ActiveRecord::Base
  belongs_to :user
  has_many :lists, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 200 }
end
