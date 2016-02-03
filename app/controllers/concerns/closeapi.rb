# Module for communicating with the Close.io api 
# via the close.io gem ---> https://github.com/taylorbrooks/closeio
require 'closeio'

module Closeapi < ApplicationController
  extend ActiveSupport::Concern
  
  # Connects current_user to Close.io account
  def initialize
    @client = Closeio::Client.new(ENV['CLOSE_API_KEY'])
  end
  
  # Retrieves unqiue companies within leads from employee
  def find_unique_company_leads
    @client.list_leads
  end
  
  # Finds all of the unique employees for a particular company
  def find_unique_company_employees
    
  end
  
  # Find all leads
  def leads
    @client.leads
  end
end
