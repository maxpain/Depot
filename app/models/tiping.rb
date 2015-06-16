class Tiping < ActiveRecord::Base
  has_many :products
  validates :title, :description, presence: true
  validates :title, uniqueness: true

  before_destroy :check_products

  private

  def check_products
      !products.exists?
  end
    
end
