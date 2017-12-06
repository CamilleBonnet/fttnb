class UsersController < ApplicationController


  def show
    if params[:id] == 'myprofile'
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @user_flats = Flat.where(user_id: current_user.id)
  end

  def edit
    @user = current_user
  end

  def update
   current_user
   current_user.update(user_params)
   redirect_to myprofile_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :photo)
  end
end
