class ProfilesController < ApplicationController

  # GET to /user/:user_id/profile/new
  def new
    # Render blank profile details form
    @profile = Profile.new
  end

  def create

  end

  def edit

  end


end
