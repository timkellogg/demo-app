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
    
    # TODO: when the company is pulled from the spreadsheet, that makes the assumption that there is only one company on the sheet and the first one is the reference 
    # TODO: doesn't handle nil values for company name yet. Company name should be written out or the company will be off by one. 
    begin
      Campaign.import(campaign_params[:file_url])
      @campaign.company_id = Client.last.company.id  
    rescue => e
      flash[:danger] = "Something went wrong with the file upload. Please make sure everything is filled in like the example format. Also, make sure that the company exists that you are trying to add clients to."
      render :new
      return
    end
    
    convert_date(campaign_params[:campaign_date])
  
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
    
    # jQuery datepicker sends date in American format but Ruby expects it to be in European format
    def convert_date(date)
      campaign_params[:campaign_date] = Date.parse(date)
    end
end
