class Post < ApplicationRecord
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :spot, presence: true, length: { maximum: 50 }
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
end
