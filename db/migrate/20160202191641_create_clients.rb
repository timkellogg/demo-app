class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :city_id
      t.integer :company_id
      t.string :company_name
      t.string :contact_email
      t.integer :country_id
      t.boolean :deleted, default: false
      t.string :first_name
      t.string :int_address
      t.string :int_city
      t.string :int_state
      t.string :int_zipcode
      t.string :last_name
      t.string :phone
      t.integer :quickbooks_id
      t.integer :state_id
      t.string :street_address
      t.float :tax
      t.string :title
      t.integer :user_id
      t.integer :zipcode
      
      t.timestamps
    end
  end
end
