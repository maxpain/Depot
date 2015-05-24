class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :count, presence: true, numericality: {greater_than_or_equal_to: 1}


  def total_price
   product.price * count
  end

end
