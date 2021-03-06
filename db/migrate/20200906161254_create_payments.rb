class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.float :total_amount, null: false, default: 0
      t.float :total_discounts, null: false,  default: 0
      t.float :total_with_discounts, null: false, default: 0
      t.date :payment_date, null: false

      t.belongs_to :client

      t.timestamps
    end
  end
end
