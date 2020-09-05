class CreateClient < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :external_id, null: false, default: ''
      t.string :email, null: false, default: ''
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.string :job
      t.string :country
      t.string :address
      t.string :zip_code
      t.string :phone

      t.timestamps
    end
  end
end
