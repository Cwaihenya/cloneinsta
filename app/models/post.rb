class Post < ApplicationRecord
mount_uploader :image, ImageUploader
belongs_to :user
validates :image, presence: true
validates :user_id, presence: true
has_many :favorites, dependent: :destroy
has_many :favorite_users, through: :favorites, source: :user
end
