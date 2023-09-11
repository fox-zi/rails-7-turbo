class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :user
      t.references :account
      t.references :order
      t.integer :status

      t.timestamps
    end
  end
end
