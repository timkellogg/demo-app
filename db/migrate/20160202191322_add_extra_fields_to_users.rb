class AddExtraFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company_name, :string
    add_column :users, :country_id, :integer
    add_column :users, :firstname, :string
    add_column :users, :international, :boolean, default: false
    add_column :users, :invitation_id, :integer
    add_column :users, :lastname, :string
    add_column :users, :name, :string
    add_column :users, :title, :string
  end
end




