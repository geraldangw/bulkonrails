class Product < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :product, presence: true
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 400 }
  validates :brand, presence: true, length: { maximum: 40 }
  validates :category, presence: true, length: { maximum: 40 }
  validates :price, presence: true, length: { maximum: 10 }
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
