class CreateLineItemDates < ActiveRecord::Migration[7.0]
  def change
    create_table :line_item_dates do |t|
      t.references :task, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end

     add_index :line_item_dates, [:date, :task_id], unique: true
     add_index :line_item_dates, :date
  end
end
