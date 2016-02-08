class AddCustomerTypeToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :customer_type, :string, default: "Integrator"
  end
end
