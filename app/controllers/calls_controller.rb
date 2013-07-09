class CallsController < ApplicationController
  def index
    @calls = Call.all
  end

  def new
    @call = Call.new
    binding.pry
  end

  def create
    call = Call.create(params[:call])
    binding.pry
    # how do I get the call organiser's timezone?
    Time.zone = params[:call.organiser][:timezone] #need to know how to get the organisers timezone
    call.time = Time.use_zone(Time.zone) {Time.zone.parse(params[:call][:time]).in_time_zone(Time.zone)}
    call.save
    # call.attendees.each do |attendee|
      # need to store the meeting date and time in UTC
      # attendee.meetingdate = call.date
      # attendee.accepted = FALSE # add this to database level
      # attendee.save
    # end
    redirect_to(call)
  end

  def show
    @call = Call.find(params[:id])
  end

  def edit
    @call = Call.find(params[:id]) #find the call we want to update
  end

  def update
    call = Call.find(params[:id]) #find the call we want to update
    call.update_attributes(params[:call])
    redirect_to(call)
  end

  def destroy
    call = Call.find(params[:id])
    call.destroy
    redirect_to(calls_path)
  end

end