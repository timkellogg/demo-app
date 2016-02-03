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
  
  # Show individual campaign
  def show  
    
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