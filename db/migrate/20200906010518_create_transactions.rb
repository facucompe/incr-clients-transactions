class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.float :amount, null: false
      t.integer :currency, null: false
      t.boolean :approved?, null: false

      t.belongs_to :client

      t.timestamps
    end
  end
end
