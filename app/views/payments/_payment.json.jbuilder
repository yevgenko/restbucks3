json.extract! payment, :id, :card_number, :card_type, :order_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
