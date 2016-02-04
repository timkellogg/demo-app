class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @companies = Company.all
      .order(name: :asc)
      .paginate(:page => params[:page])
  end
  
  def show
  end
    
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(company_params)
    
    if @company.save
      flash[:success] = 'Company was successfully created'
      redirect_to company
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @company.update(company_params)
      flash[:success] = 'Company was successfully updated'
      redirect_to companies_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @company.destroy
    flash[:success] = 'Company was successfully removed'
    respond_to do |format|
      format.js { render :js => "window.location = '/' "}
      format.html { redirect_to companies_path, flash[:success] = 'Company successfully removed' }
    end
  end
  
  private
  
    def company_params
      params.permit(:company, :address, :city_id, :country_id,:coupon_id, :default_labor_tax, :default_tax, :defaultavatar_id, :distributor_id, :engineering_labor_cost, :engineering_labor_price, :install_labor_cost, :install_labor_price, :int_address, :int_city, :int_state, :int_zipcode, :intcurrency_id, :name, :phone, :po_custom_id, :po_custom_prefix, :programming_labor_cost, :programming_labor_price, :project_custom_id, :project_custom_prefix, :project_terms, :ship_address, :ship_city_id, :ship_city_name, :ship_city_state, :ship_city_zip, :ship_taxes, :stripe_customer_token, :supervision_labor_cost, :supervision_labor_price, :tax_labor, :trial_days, :url, :processed
      )
    end
    
    def set_company
      @company = Company.find(params[:id])
    end
end
