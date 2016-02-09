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
  
  # Removes campaigns that are on local but not on cloud
  # Probably a better way to integrate this into the last method
  def remove_deleted_campaigns
    campaigns_to_delete = []
    
    # Find all of the campaigns in Close
    @close_campaigns = @client.find_lead('').data
  
    # Iterate through every local campaign and compare that to every Close campaign 
    # If the close campaign never is found to be a local campaign and it's searched 
    # through every local campaign, add it to be deleted
    Campaign.all.each do |local_campaign|
      index = 0
      @close_campaigns.each do |close_campaign|
        if close_campaign.name != local_campaign.name && index == @close_campaigns.length - 1
          campaigns_to_delete << local_campaign.id
        end
        index += 1
      end
    end
      
    campaigns_to_delete.each { |campaign| Campaign.delete(campaign) }
  end
  
  # compares the opporunities listed in close.io with those listed in the database
  # TODO: improve efficiency of comparing data from sources
  # TODO: replace with native API and remove gem wrapper
  def sync_opportunities
    @close_campaigns = @client.find_lead('').data
    
    remove_deleted_campaigns

    # campaigns 
    @close_campaigns.each do |close_campaign|

      # campaign contacts
      close_campaign.contacts.each do |contact|

        # contact emails
        contact.emails.each do |email_address|
          
          # If there's already a user with that address, find that user
          user = User.find_by_email(email_address.email)
          name = contact.name.split(' ')

          begin
            # If there is not, save to db
            if user.nil?
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
            end
          
          found_company = Company.find_by_name(name)

          if found_company.nil?
            Company.create!(
              processed: false, 
              name: close_campaign.name
            )

            user.company_ids = Company.last.id
            user.save!
          end
          
          # find campaign
          found_campaign = Campaign.find_by_name(close_campaign.name)

          # if there is not a campaign, create one
          if found_campaign.nil?
            Campaign.create!(
              company_id: found_company.try(:id) || Company.last.id,
              name: close_campaign.name,
              channel: 'Other',
              campaign_type: 'Other',
              campaign_date: close_campaign.date_created
            ) 
          # if there is a campaign already, update it 
          else 
            # TODO: later on, this is where you can update the attributes
            # However, currently, there are not attributes that would need to be 
            # updated such as status_label or description
          end
          
          rescue => e
            Rails.logger << "Could not save #{email_address.email} from Close.io because of #{e}"
            break
          end
        end
      end  
    end
  end
end