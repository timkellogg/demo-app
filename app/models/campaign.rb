require 'roo'

class Campaign < ActiveRecord::Base
  belongs_to :company
  
  # converts file uploads into campaign model
  def self.import(file)
    
    # TODO: Method to detect file extension and parse csv,xls,libre differently
    # TODO: Fix parsing of file
    begin 
      workbook = Roo::Excelx.new(file.path)
      workbook.default_sheet = workbook.sheets.first
      hash_of_campaign_attributes = ((workbook.first_row + 1)..workbook.last_row).each_with_object({}) do |row, hash|
        next if workbook.row(row).nil?
          company_id = workbook.row(row)[0]
          name = workbook.row(row)[1]
          channel = workbook.row(row)[2]
          campaign_type = workbook.row(row)[3]
          campaign_date = workbook.row(row)[4]
      end
      
      puts "#{hash_of_campaign_attributes}"
      
    rescue => e
      Rails.logger << "Error while processing file upload"
      # TODO: add file upload error to display on page to user
    end
  end
  
  # validate uniquess of join on campaign and company
  # validates_uniqueness_of :company_id, :scope => [:company_id]
  
  validates_presence_of :company_id,
                        :name,
                        :channel,
                        :campaign_type,
                        :campaign_date
end
