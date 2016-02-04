class Campaign < ActiveRecord::Base
  belongs_to :company
  
  # converts file uploads into campaign model
  def self.import(file)

    begin
      # TODO: Method to detect file extension and parse csv,xls,libre differently
      CSV.foreach(file.path, headers: true) do |row|
        next if row[0].nil?
        Client.create! row.to_hash.compact
      end
    rescue => e
      Rails.logger << "Error while processing file upload"
      Rails.logger << "#{e}"
      # TODO: add file upload error to display on page to user
    end
  end
  
  validates_presence_of :name,
                        :channel,
                        :campaign_type,
                        :campaign_date
end
