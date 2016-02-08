# Module for communicating with the Close.io api 
# via the close.io gem ---> https://github.com/taylorbrooks/closeio
require 'closeio'

module Closeapi
  extend ActiveSupport::Concern
  
  # Connects current_user to Close.io account
  def initialize
    super
    @client = Closeio::Client.new(ENV['CLOSE_API_KEY'])
  end
    
  # compares the opporunities listed in close.io with those listed in the database
  # TODO: improve efficiency of comparing data from sources
  # TODO: replace with native API and remove gem wrapper
  def sync_opportunities
    @close_campaigns = @client.find_lead('').data

    # campaigns 
    @close_campaigns.each do |close_campaign|
      
      # campaign contacts
      close_campaign.contacts.each do |contact|

        # contact emails
        contact.emails.each do |email_address|

          # If there's already a user with that address, skip
          return if User.find_by_email(email_address.email)
          name = contact.name.split(' ')
          
          begin
            # If there is not, save to db
            user = User.new(
              email: email_address.email,
              password: 'password',
              password_confirmation: 'password',
              company_name: contact.display_name,
              country_id: nil,
              name: name,
              lastname: name.last,
              firstname: name.first,
              title: contact.title,
              roles_mask: 2
            )
          
            # TODO: have to have error checks because there may be mispellings, etc.
            found_company = Company.find_by_name(name)

            if found_company.nil?
              # Create company
              Company.create!(
                processed: false, # Sets state that allows incomplete companies to be saved
                name: close_campaign.name
              )

              user.company_ids = Company.last.id
              user.save!
            end

            # Add it as a lead
            Campaign.create!(
              company_id: found_company.try(:id) || Company.last.id,
              name: close_campaign.name,
              channel: 'Other',
              campaign_type: 'Other',
              campaign_date: close_campaign.date_created
            )
          
          rescue => e
            Rails.logger << "Could not save #{email_address.email} from Close.io because of #{e}"
            break
          end
        end
      end  
    end
  end
end
