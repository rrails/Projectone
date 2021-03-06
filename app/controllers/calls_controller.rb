class CallsController < ApplicationController
  def index
    @calls = Call.order(:date).all
    @calls.each do |call|
      call.lmeettime = call.time.in_time_zone(@auth.timezone) #convert time to users's timezone
    end
  end

  def new
    @call = Call.new
    @call.organiser = @auth.name
    @users = User.order(:user).all
    @users.each do |user|
      user.lstarttime = user.preferredstarttime.in_time_zone(@auth.timezone) #store in time in local variables
      user.lendtime = user.preferredendtime.in_time_zone(@auth.timezone)
    end
  end

  def create
    call = Call.new(params[:call])
    Time.zone = @auth.timezone
    call.time = Time.use_zone(Time.zone) {Time.zone.parse(params[:call][:meet_time]).in_time_zone(Time.zone)}
    call.attendees.each do |attendee|
      attendee.meetingdate = call.date
      attendee.save
    end
    if call.save
      redirect_to(call)
    else
      render :new
    end
  end

  def show
    @call = Call.find(params[:id])
  end

  def edit
    @call = Call.find(params[:id]) #find the call we want to update
    @call.lmeettime = @call.time.in_time_zone(@auth.timezone)
    @users = User.order(:user).all
    @users.each do |user|
      user.lstarttime = user.preferredstarttime.in_time_zone(@auth.timezone)
      user.lendtime = user.preferredendtime.in_time_zone(@auth.timezone)
    end
  end

  def update
    @call = Call.find(params[:id]) #find the call we want to update
      if @auth.name == @call.organiser
        Time.zone = @auth.timezone #convert time to organiser timezone
        # Trust me this works
        @call.time = Time.use_zone(Time.zone) {Time.zone.parse(params[:call][:meet_time]).in_time_zone(Time.zone)}
        @call.attendees.each do |attendee|
          attendee.meetingdate = @call.date
          attendee.save
        end
        @call.update_attributes(params[:call])
        redirect_to(@call)
      else
        flash[:notice] = "Only organisers of the call can edit the call details."
        redirect_to(calls_path)
      end
  end

  def destroy
    call = Call.find(params[:id])
    call.destroy
    redirect_to(calls_path)
  end

end