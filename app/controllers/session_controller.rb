class SessionController < ApplicationController
  def new
  end

  def create
    user = User.where(:name => params[:username]).first
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(user_path(user))
    else
      flash[:notice] = "Incorrect login. Please try again."
      redirect_to(login_path)
    end
      session[:user_id] = user.id
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end
end