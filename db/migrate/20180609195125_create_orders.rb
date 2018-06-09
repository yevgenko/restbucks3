class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.text :items
      t.string :status

      t.timestamps
    end
  end
end
