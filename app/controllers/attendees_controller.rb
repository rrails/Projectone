class AttendeesController < ApplicationController
  def index
    @attendees = Attendee.all
  end

  def new
    @attendee = Attendee.new

  end

  def create
    attendee = Attendee.create(params[:attendee])
    redirect_to(attendee)
  end

  def show
    @attendee = Attendee.find(params[:id])
    binding.pry
  end

  def edit
    @attendee = Attendee.find(params[:id]) #find the attendee we want to update
    binding.pry

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