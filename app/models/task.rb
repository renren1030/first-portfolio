class Task < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user 
  has_many :favorites
  validates :name, presence: true
  validates :content, presence: true,length: { maximum: 30}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
