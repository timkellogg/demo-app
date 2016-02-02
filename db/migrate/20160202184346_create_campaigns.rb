class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|

      t.integer :company_id
      t.string :name
      t.string :channel
      t.string :campaign_type
      t.date :campaign_date
      t.string :file_url
    end
  end
end
