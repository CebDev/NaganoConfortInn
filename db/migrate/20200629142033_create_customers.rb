class CreateCustomers < ActiveRecord::Migration
  def up
    create_table :customers do |t|
      t.string :name
      t.string :first_name
      t.text :address
      t.string :zip_code
      t.string :city
      t.string :country
      t.string :phone_number
      t.string :email
      t.timestamps
    end
  end

  def down
  end
end
