class Order < ApplicationRecord
  has_one :payment

  # Could use concerns to inject activities without touching models,
  # perhaps even with special DSL describing describing Domain Application Protocol (DAP)
  after_create :create_order_activity

  def preparing?
    status == 'preparing'
  end

  private

  def create_order_activity
    CreateOrderActivity.perform(self)
  end

  class CreateOrderActivity
    class << self
      def perform(order)
        order.create_payment
        order.update_attribute :status, 'payment-expected'
      end
    end
  end
end
