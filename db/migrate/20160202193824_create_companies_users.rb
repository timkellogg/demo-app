class CreateCompaniesUsers < ActiveRecord::Migration
  def change
    create_table :companies_users do |t|
      t.integer :company_id
      t.integer :user_id
      t.boolean :deactivate, default: false
      t.integer :distributor_id
      t.string :usertype
      
      t.timestamps
    end
  end
end
