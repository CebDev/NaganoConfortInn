class CreateSettings < ActiveRecord::Migration
  def up
    create_table :settings do |t|
      t.string :company_name
      t.text :address
      t.string :zip_code
      t.string :city
      t.string :country
      t.string :phone_number
      t.string :email
      t.float :tps
      t.float :tvq
    end
  end

  def down
  end
end
