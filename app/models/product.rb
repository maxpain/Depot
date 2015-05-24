class Product < ActiveRecord::Base
  has_many :line_items
  belongs_to :manufacturer
  belongs_to :tiping
	mount_uploader :image_url, ProductImageUploader
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
  with: %r{\.(gif|jpg|png)\Z}i,
  message: 'URL должен указывать на изображение формата GIF, JPG или PNG'
  }  
end
