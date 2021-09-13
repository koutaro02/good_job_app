class Message < ApplicationRecord
  belongs_to :map
  belongs_to :user
  has_one_attached :image

  validates :comment, presence: :true
end
