class AddOtherDetailsToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :channel_details, :string
  end
end
