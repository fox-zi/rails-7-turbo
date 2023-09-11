class CreateAccountTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :account_transactions do |t|
      t.references :user
      t.references :account
      t.references :order
      t.string :status

      t.timestamps
    end
  end
end
