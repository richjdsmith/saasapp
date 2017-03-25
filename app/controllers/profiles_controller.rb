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
      redirect_to user_path(id: params[:user_id] )
    else

      render action: :new
    end
  end

  # GET to /users/:user_id/profile/edit
  def edit
    @user = User.find( params[:user_id] )
    @profile = @user.profile
  end

  # PUT to /users/:user_id/profile
  def update
    # retrieve user from database
     @user = User.find( params[:user_id] )
     # retrieve user's profile
     @profile = @user.profile
     # mass asign edited prfile updates and save(mass attribute)
     if @profile.update_attributes(profile_params)
      flash[:success] = "Profile has been updated!"
      # redirect user to their profile page
      redirect_to user_path(id: params[:user_id])
    else
      render action: :edit
    end
  end


private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :contact_email, :phone_number, :job_title, :description, :avatar)
  end

end
