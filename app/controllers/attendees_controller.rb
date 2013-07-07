class AttendeesController < ApplicationController
  def index
    @attendees = Attendee.all
  end

  def new
    @attendee = Attendee.new

  end

  def create
    binding.pry
    attendee = Attendee.create(params[:attendee])
    redirect_to(attendee)
  end

  def show
    @attendee = Attendee.find(params[:id])
  end

  def edit
    @attendee = Attendee.find(params[:id]) #find the attendee we want to update
  end

  def update
    attendee = Attendee.find(params[:id]) #find the attendee we want to update
    attendee.update_attributes(params[:attendee])
    redirect_to(attendee)
  end

  def destroy
    attendee = Attendee.find(params[:id])
    attendee.destroy
    redirect_to(attendees_path)
  end

end