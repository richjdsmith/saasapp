class ProfilesController < ApplicationController

  # GET to /user/:user_id/profile/new
  def new
    # Render blank profile details form
    @profile = Profile.new
  end

  # This is for when we get a post request for /users/:user_id/profile
  def create
    # Ensure that we have the user filling form
    @user = User.find( params[:user_id] )
    # Create profile linked to this specific user using the build..
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Your profile was created!"
      redirect_to user_path( params[:user_id] )
    else
      render action: :new
    end
  end

  def edit

  end


private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :contact_email, :phone_number, :job_title, :description, :avatar)
  end

end
