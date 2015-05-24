class Order < ActiveRecord::Base
  has_many :line_items
  belongs_to :user
  
  before_create :set_status

  enum status: [:cart, :sended, :completed, :performed, :made]

  def send!(send_params)
    update(send_params.merge(status: :sended))
  end

  def complete!
    update(status: :completed)
  end

  def perform!
    update(status: :performed)
  end

  def calculate_total_price
    result = 0
    line_items.each do |line_item|
      result += line_item.total_price
    end
    update(total_price: result)
    result
  end

  private

    def set_status
      self.status = :cart
    end




end
