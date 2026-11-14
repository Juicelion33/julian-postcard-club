class Article < ApplicationRecord
  REGIONS = ["Americas", "Europe", "Asia", "Africa", "Oceania"].freeze
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5, maximum: 160 }
  validates :body, presence: true, length: { minimum: 20 }
  validates :region, inclusion: { in: REGIONS }
  STATUSES = ["Visited", "Wishlist"].freeze
  validates :destination, presence: true
  validates :trip_status, inclusion: { in: STATUSES }

end
