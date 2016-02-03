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
  def sync_opportunities
    @close_campaigns = @client.find_lead('').data
    
    # campaigns 
    @close_campaigns.each do |close_campaign|
      # campaign contacts
      close_campaign.contacts.each do |contact|
        
        # contact emails
        contact.emails.each do |email_address|
          # split_address = email_address.email.split('@')
          # contact = split_address.first
          # domain = split_address.last
          
          # If there's already a user with that address, skip
          return if User.find_by_email(email_address.email)
          name = contact.name.split(' ')
          
          begin
            # If there is not, save to db
            user = User.new(
              email: email_address.email,
              password: 'password',
              password_confirmation: 'password_confirmation',
              company_name: contact.display_name,
              country_id: nil,
              name: name,
              lastname: name.last,
              firstname: name.first,
              title: contact.title,
              roles_mask: 2
            )
          
          # TODO: have to have error checks because there may be mispellings, etc.
          company = Company.find_by_name(name)
          
          if company.nil?
            # Create company
            Company.create!(
              processed: false, # Sets state that allows incomplete companies to be saved
              name: close_campaign.name
            )
            
            user.company_ids = Company.last.id
            user.save!
          end
          
          rescue => e
            Rails.logger << "Could not save #{email_address.email} from Close.io"
            break
          end
        end
      end  
    end
  end
end
