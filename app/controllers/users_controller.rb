class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # saving to db
    @user = User.new(params[:user])
    # Convert times from user timezone to UTC
    Time.zone = params[:user][:timezone]
    @user.preferredstarttime = Time.use_zone(Time.zone) {Time.zone.parse(params[:user][:preferredstarttime]).in_time_zone(Time.zone)}
    @user.preferredendtime = Time.use_zone(Time.zone) {Time.zone.parse(params[:user][:preferredendtime]).in_time_zone(Time.zone)}
      if @user.save
        redirect_to(root_path)
      else
        render :new
      end
  end

  def show
    @user = User.find(params[:id])
    @user.preferredstarttime = @user.preferredstarttime.in_time_zone(@user.timezone)
    @user.preferredendtime = @user.preferredendtime.in_time_zone(@user.timezone)
  end

  def edit
    @user = @auth
    @user.preferredstarttime = @user.preferredstarttime.in_time_zone(@user.timezone)
    @user.preferredendtime = @user.preferredendtime.in_time_zone(@user.timezone)
    render :new
  end

  def update
    @user = @auth
    # convert the time from user timezone to UTC
    Time.zone = params[:user][:timezone]

    @user.preferredstarttime = Time.use_zone(Time.zone) {Time.zone.parse(params[:user][:preferredstarttime]).in_time_zone(Time.zone)}
    @user.preferredendtime = Time.use_zone(Time.zone) {Time.zone.parse(params[:user][:preferredendtime]).in_time_zone(Time.zone)}
    @user.save

    if @user.update_attributes(params[:user])
      redirect_to(users_path)
    else
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to(users_path)
  end

  def meets
    @user = User.find(params[:id])
    binding.pry

  end

end