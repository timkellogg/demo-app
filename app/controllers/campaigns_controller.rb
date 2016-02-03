require 'closeio'

class CampaignsController < ApplicationController
  # include Closeapi
  before_action :authenticate_user!
  
  # Show all leads
  def index
    @campaigns = Campaign.all
      .order(name: :desc)
      .paginate(:page => params[:page])
  end

  def show  
    @campaign = Campaign.find(params[:id]);
    
    # TODO: prevent making a second call to the db. When rails loads in the 
    # campaign variable, it doesn't bring in the join relationship
    @employees = Campaign.find(params[:id]).company.users
  end

  def new
    
  end
  
  def create  
    
  end
  
  def edit
    
  end
  
  def updated
  end
  
  def destroy
  end
  
  private
  
    def set_campaign
      
    end
    
    def campaign_params
      
    end
end