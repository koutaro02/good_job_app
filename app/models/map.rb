class Map < ApplicationRecord
  has_many :map_users, dependent: :destroy
  has_many :users, through: :map_users
  has_many :messages, dependent: :destroy

  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :address
    validates :latitude
    validates :longitude
    validates :content
  end

  geocoded_by :address
  before_validation :geocode

end
