class Payment < ApplicationRecord
  belongs_to :order

  after_update :update_payment_activity

  private

  def update_payment_activity
    # TODO: possibly process payment through 3rd party service
    # TODO: record payment date
    # TODO: validate order status, i.e. "payment-expected" only!
    order.update_attribute :status, 'preparing'
  end
end
