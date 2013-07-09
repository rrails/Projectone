class UsersController < ApplicationController

  def time_zone(user, &block)
    Time.use_zone(user.timezone, &block)
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # should this be User.new or User.create
    @user = User.new(params[:user])
    # Convert times from user timezone to UTC
    Time.zone = params[:user][:timezone]
    @user.preferredstarttime = Time.use_zone(Time.zone) {Time.zone.parse(params[:user][:preferredstarttime]).in_time_zone(Time.zone)}
    @user.preferredendtime = Time.use_zone(Time.zone) {Time.zone.parse(params[:user][:preferredendtime]).in_time_zone(Time.zone)}
    @user.save

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
    @user = @auth #find the user we want to update
    # convert the time from user timezone to UTC
    Time.zone = params[:user][:timezone]
    @user.preferredstarttime = Time.use_zone(Time.zone) {Time.zone.parse(params[:user][:preferredstarttime]).in_time_zone(Time.zone)}
    @user.preferredendtime = Time.use_zone(Time.zone) {Time.zone.parse(params[:user][:preferredendtime]).in_time_zone(Time.zone)}
    @user.save

    if @user.update_attributes(params[:user])
      redirect_to(root_path)
    else
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to(users_path)
  end

end