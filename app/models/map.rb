class Map < ApplicationRecord
  has_many :map_users
  has_many :users, through: :map_users

  geocoded_by :address
  before_validation :geocode

end
