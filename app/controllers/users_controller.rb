class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    if @user != current_user
      flash[:danger] = 'You are not the owner of that account'
      redirect_to root_path
    end
    @clients = @user.clients.order(last_name: :asc)
  end
  
  
end
