class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @clients = Client
      .where(user_id: current_user.id)
      .order(last_name: :asc)
      .paginate(:page => params[:page])
  end
  
  def show
  end
  
  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(client_params)
    
    company = Company.find_or_create_by(name: client_params[:company_name])
    
    @client.company = company
    @client.user = current_user
    
    if @client.save
      flash[:success] = 'Client as successfully added'
      redirect_to @client
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @client.update_attributes(client_params)
      flash[:success] = 'Client was updated'
      redirect_to client
    else
      render 'edit'
    end
  end
  
  def destroy
  end
  
  private
    
    def set_client
      @client = Client.find(params[:id])
    end
    
    def client_params
      params.require(:client).permit(:city_id, :company_id, :company_name, :contact_email, :country_id, :deleted, :first_name, :int_address, :int_city, :int_state, :int_zipcode, :last_name, :phone, :quickbooks_id, :state_id, :street_address, :tax, :title, :user_id, :zipcode, :created_at, :updated_at)
    end
    
    # TODO: implement method to protect authorized users from accessing resources
    # def check_permission
    #   return if current_user && current_user !== @user
    # end
end
