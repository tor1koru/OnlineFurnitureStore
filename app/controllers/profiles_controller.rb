class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to profile_path, notice: "Profile successfully updated."
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:bio, :avatar, :other_attributes)
  end
end