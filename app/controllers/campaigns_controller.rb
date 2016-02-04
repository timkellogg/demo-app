class CampaignsController < ApplicationController
  include Closeapi
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
    
    if @campaign.save
      flash[:success] = "Campaign was successfully saved"
      redirect_to campaigns_path
    else 
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
