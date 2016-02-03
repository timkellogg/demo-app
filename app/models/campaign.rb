class Campaign < ActiveRecord::Base
  belongs_to :company
  
  # validate uniquess of join on campaign and company
  # validates_uniqueness_of :company_id, :scope => [:company_id]
  
  validates_presence_of :company_id,
                        :name,
                        :channel,
                        :campaign_type,
                        :campaign_date,
                        :file_url
end
