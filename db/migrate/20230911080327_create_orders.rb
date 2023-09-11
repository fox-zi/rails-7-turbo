class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.string :type
      t.string :currency
      t.string :base_currency
      t.string :price
      t.decimal :amount, default: 0

      t.timestamps
    end
  end
end
