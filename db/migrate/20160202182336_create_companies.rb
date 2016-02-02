class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|

      t.string :address
      t.integer :city_id
      t.integer :country_id
      t.integer :coupon_id
      t.float :default_labor_tax
      t.float :default_tax
      t.integer :defaultavatar_id
      t.integer :distributor_id
      t.integer :engineering_labor_cost
      t.integer :engineering_labor_price
      t.string :image_content_type
      t.string :image_file_name
      t.integer :image_file_size
      t.time :image_updated_at
      t.integer :install_labor_cost
      t.integer :install_labor_price
      t.string :int_address
      t.string :int_city
      t.string :int_state
      t.string :int_zipcode
      t.integer :intcurrency_id
      t.string :name 
      t.string :phone
      t.integer :po_custom_id
      t.string :po_custom_prefix
      t.integer :programming_labor_cost
      t.integer :programming_labor_price
      t.integer :project_custom_id
      t.string :project_custom_prefix
      t.text :project_terms
      t.string :ship_address
      t.integer :ship_city_id 
      t.string :ship_city_name
      t.string :ship_city_state
      t.string :ship_city_zip
      t.boolean :ship_taxes, default: false 
      t.string :stripe_customer_token
      t.integer :supervision_labor_cost
      t.integer :supervision_labor_price
      t.boolean :tax_labor, default: false
      t.string :tax_name
      t.integer :trial_days
      t.string :url

      t.timestamps
    end
  end
end
