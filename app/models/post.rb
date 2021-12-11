class Post < ApplicationRecord
  
  with_options presence: true do
    validates :content, length: { maximum: 255 }
    validates :spot, length: { maximum: 50 }
    validates :image
    validates :longitude
    validates :latitude
  end
  
  geocoded_by :spot
  before_validation :geocode, if: :spot_changed?
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
end
