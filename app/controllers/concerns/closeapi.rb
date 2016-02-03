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
  def sync_opportunities
    @local_campaigns = Campaign.all
    @close_campaigns = @client.list_opportunities
    
    
  end
  
  # Find all leads
  def leads
    @client.leads
  end
end
