class Order < ApplicationRecord
  has_one :payment

  def preparing?
    status == 'preparing'
  end
end
