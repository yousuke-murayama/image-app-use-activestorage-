class User < ApplicationRecord
  before_save { self.email.downcase! }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
 
  
  with_options presence: true do
    validates :name, length: { maximum: 30 }
    validates :profile, length: { maximum: 150 }
    validates :email, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    
    validates :password, length: { minimum: 8 }
  end
  
  mount_uploader :icon, ImageUploader
  
  has_many :comments
  has_many :posts
  has_many :favorites
  has_many :like_posts, through: :favorites, source: :post, dependent: :destroy
  
  def add_favorite(post)
    self.favorites.find_or_create_by(post_id: post.id)
  end
  
  def unfavorite(post)
    favorite = self.favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
  
  def added_favorite?(post)
    self.like_posts.include?(post)
  end
  
end
