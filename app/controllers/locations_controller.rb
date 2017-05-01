class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(locations_params)
    @eventshow = Event.find(session[:ugid])
    users = @eventshow.users
    if @location.save
      redirect_to event_path(@eventshow)
    else
      flash[:notice] = @location.errors.full_messages.join(", ")
      redirect_to event_path(@eventshow)
    end
  end

  private

   def locations_params
     params.require(:location).permit(:user_id, :event_id, :name, :street_address, :city, :state, :description)
   end

  #  def all_locations_submitted?(users)
  #    users.each do |user|
  #      if user.preferences.empty?
  #        @submit = false
  #        break
  #      else !user.preferences.empty? && @recommendation.nil?
  #        @submit = true
  #      end
  #    end
  #  end
end
