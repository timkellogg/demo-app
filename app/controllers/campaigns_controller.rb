# Require gems necessary to import and manage csv formats
require 'csv'

class CampaignsController < ApplicationController
  include Closeapi
  before_action :authenticate_user!
  
  # Show all leads
  def index
    @campaigns = Campaign.all
      .order(name: :asc)
      .paginate(:page => params[:page])
  end

  def show  
    @campaign = Campaign.find(params[:id]);
    
    # TODO: prevent making a second call to the db. When rails loads in the 
    # campaign variable, it doesn't bring in the join relationship
    @employees = Campaign.find(params[:id]).company.users
  end
  
  # Compares campaign information from Close.io with local
  def sync
    begin
      sync_opportunities
    rescue => e
      flash[:danger] = 'Something went wrong with the sync.'
    end
    render :index
  end

  def new
    @campaign = Campaign.new
  end
  
  # Allow users to upload/create new leads and persist those to Close.io
  def create  
    @campaign = Campaign.new(campaign_params)
    
    # If the company is not already in the database, cancel the save, notify user
    begin
      binding.pry
      company = Company.find_by_name(campaign_params[:name])
      @campaign.company_id = company.id
    rescue => e
      flash[:danger] = "There is no company named #{campaign_params[:name]}!"
      redirect_to new_campaign_path
      return
    end
    
    # Handles file upload
    # TODO: sidekiq to process in the background 
    # Campaign.import(campaign_params[:file_url])
    
    if @campaign.save
      flash[:success] = "Campaign was successfully saved"
      redirect_to campaigns_path
    else 
      flash[:danger]
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
    def set_campaign
      
    end
    
    def campaign_params
      params.require(:campaign).permit(:company_id, :name, :channel, :campaign_type, :campaign_date, :file_url)
    end
end
