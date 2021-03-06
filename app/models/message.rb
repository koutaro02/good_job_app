class Message < ApplicationRecord
  belongs_to :map
  belongs_to :user
  has_one_attached :image

  validates :comment, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
