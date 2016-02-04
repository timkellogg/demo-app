class Campaign < ActiveRecord::Base
  belongs_to :company
  
  # converts file uploads into campaign model
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      campaign = find_by_id(row['id']) || new
      campaign.attributes = row.to_hash.slice(*accessible_attributes)
    end
  end
  
  # validate uniquess of join on campaign and company
  # validates_uniqueness_of :company_id, :scope => [:company_id]
  
  validates_presence_of :company_id,
                        :name,
                        :channel,
                        :campaign_type,
                        :campaign_date,
                        :file_url
end
