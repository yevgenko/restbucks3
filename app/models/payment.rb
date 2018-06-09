class Payment < ApplicationRecord
  belongs_to :order

  after_update :update_payment_activity

  private

  def update_payment_activity
    UpdatePaymentActivity.perform(self)
  end

  class UpdatePaymentActivity
    class << self
      def perform(payment)
        # TODO: possibly process payment through 3rd party service
        # TODO: record payment date
        # TODO: validate order status, i.e. "payment-expected" only!
        payment.order.update_attribute :status, 'preparing'
      end
    end
  end
end
