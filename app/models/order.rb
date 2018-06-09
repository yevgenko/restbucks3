class Order < ApplicationRecord
  has_one :payment

  after_create :create_order_activity

  def preparing?
    status == 'preparing'
  end

  private

  def create_order_activity
    create_payment
    update_attribute :status, 'payment-expected'
  end
end
