class AddCampaignTypeDetailsToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :campaign_type_details, :string
  end
end
