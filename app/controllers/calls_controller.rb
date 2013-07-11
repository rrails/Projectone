class CallsController < ApplicationController
  def index
    @calls = Call.all
  end

  def new
    @call = Call.new
    @call.organiser = @auth.name
    @users = User.order(:user).all
    @users.each do |user|
      user.lstarttime = user.preferredstarttime.in_time_zone(@auth.timezone)
      user.lendtime = user.preferredendtime.in_time_zone(@auth.timezone)
    end
  end

  def create
    call = Call.new(params[:call])
    Time.zone = @auth.timezone
    call.time = Time.use_zone(Time.zone) {Time.zone.parse(params[:call][:meet_time]).in_time_zone(Time.zone)}

    call.attendees.each do |attendee|
      attendee.meetingdate = call.date
      attendee.accepted = FALSE # add this to database level
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
    @users = User.order(:user).all
    @users.each do |user|
      user.lstarttime = user.preferredstarttime.in_time_zone(@auth.timezone)
      user.lendtime = user.preferredendtime.in_time_zone(@auth.timezone)
    end
  end


  def update
    call = Call.find(params[:id]) #find the call we want to update
      if @auth.name == call.organiser
        Time.zone = @auth.timezone #need to know how to get the organisers timezone
        call.time = Time.use_zone(Time.zone) {Time.zone.parse(params[:call][:meet_time]).in_time_zone(Time.zone)}
        call.attendees.each do |attendee|
            # need to store the meeting date and time in UTC
          attendee.meetingdate = call.date
          attendee.accepted = FALSE # add this to database level
          attendee.save
        end
        call.update_attributes(params[:call])
        redirect_to(call)
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