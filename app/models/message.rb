class Message < ApplicationRecord
  belongs_to :map
  belongs_to :user

  validates :comment, presence: :true
end
