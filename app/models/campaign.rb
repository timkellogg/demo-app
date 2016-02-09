class Campaign < ActiveRecord::Base
  belongs_to :company
  
  # converts file uploads into client model
  def self.import(file)
    begin
      CSV.foreach(file.path, headers: true) do |row|
        next if row[0].nil?
        
        client_attributes = row.to_hash.compact
        
        # TODO: major rework needed to clean up syntax
        # TODO: have to have a way to handle state_id / city_id
        # Currently will remove to prevent problems. In actual db, really easy to
        # wire them up but here I didn't want to change the schema too much sense
        # that will only happen for this demo
        client_attributes.delete("CITY")
        client_attributes.delete("STATE")
        
        client_attributes["company_name"] = client_attributes["COMPANY NAME"]
        client_attributes.delete("COMPANY NAME")
        
        client_attributes["first_name"] = client_attributes["REPRESENTATIVE FIRST"]
        client_attributes.delete("REPRESENTATIVE FIRST")
        
        client_attributes["last_name"] = client_attributes["REPRESENTATIVE LAST"]
        client_attributes.delete("REPRESENTATIVE LAST")
        
        client_attributes["contact_email"] = client_attributes["EMAIL"]
        client_attributes.delete("EMAIL")
        
        client_attributes["street_address"] = client_attributes["STREET"]
        client_attributes.delete("STREET")
        
        client_attributes["zipcode"] = client_attributes["ZIP"]
        client_attributes.delete("ZIP")

        client_attributes["phone"] = client_attributes["PHONE"]
        client_attributes.delete("PHONE")
        
        client_attributes["title"] = client_attributes["TITLE"]
        client_attributes.delete("TITLE")

        company = Company.find_by_name(client_attributes["company_name"].strip)
        
        raise StandardError if company.nil?
        client_attributes["company_id"] = company.id
        
        Client.create! client_attributes
      end
    end
  end
  
  validates_presence_of :name,
                        :channel,
                        :campaign_type,
                        :campaign_date

end
