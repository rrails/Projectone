class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    Time.zone = params[:user][:timezone]
    @user.preferredstarttime = Time.use_zone(Time.zone) {Time.zone.parse(params[:user][:pref_start]).in_time_zone(Time.zone)}
    @user.preferredendtime = Time.use_zone(Time.zone) {Time.zone.parse(params[:user][:pref_end]).in_time_zone(Time.zone)}
    if @user.save
      session[:user_id] = @user.id
      redirect_to(root_path)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    # For all the calls convert the time users time zone
    @user.calls.each do |call|
      call.lmeettime = call.time.in_time_zone(@auth.timezone)
    end
  end

  def edit
    @user = @auth
    @user.lstarttime =  @user.preferredstarttime.in_time_zone(@user.timezone)
    @user.lendtime =  @user.preferredendtime.in_time_zone(@user.timezone)
    render :new
  end

  def update
    @user = @auth
    Time.zone = params[:user][:timezone]

    @user.preferredstarttime = Time.use_zone(Time.zone) {Time.zone.parse(params[:user][:pref_start]).in_time_zone(Time.zone)}
    @user.preferredendtime = Time.use_zone(Time.zone) {Time.zone.parse(params[:user][:pref_end]).in_time_zone(Time.zone)}

    if @user.update_attributes(params[:user])
      redirect_to(user_path(@user))
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