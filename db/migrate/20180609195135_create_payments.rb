class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :card_number
      t.string :card_type
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
