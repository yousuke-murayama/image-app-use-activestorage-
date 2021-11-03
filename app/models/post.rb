class Post < ApplicationRecord
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :spot, presence: true, length: { maximum: 50 }
  
  belongs_to :user
end
