class CampaignsController < ApplicationController
  include Closeapi
  before_action :authenticate_user!
  before_action :set_campaign, only: [:edit, :show, :update, :destroy]
  
  def index
    @campaigns = Campaign.all
      .order(name: :asc)
      .paginate(:page => params[:page])
  end

  def show  
    # TODO: prevent making a second call to the db. When rails loads in the 
    # campaign variable, it doesn't bring in the join relationship
    @employees = Campaign.find(params[:id]).company.try(:users)
  end
  
  # Compares campaign information from Close.io with local
  def sync
    begin
      sync_opportunities
    rescue => e
      flash[:danger] = 'Something went wrong with the sync.'
    end
    
    redirect_to campaigns_path
  end

  def new
    @campaign = Campaign.new
  end
  
  def create  
    @campaign = Campaign.new(campaign_params)

    # If the company is not already in the database, cancel the save, notify user
    begin
      company = Company.find_by_name(campaign_params[:name])
      @campaign.company_id = company.id
    rescue => e
      flash[:danger] = "There is no company named #{campaign_params[:name]}!"
      redirect_to new_campaign_path
      return
    end
    
    # TODO: sidekiq to process in the background 
    Campaign.import(campaign_params[:file_url])

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
      @campaign = Campaign.find(params[:id])
    end
    
    def campaign_params
      params.require(:campaign).permit(:company_id, :name, :channel, :campaign_type, :campaign_date, :file_url)
    end
end
