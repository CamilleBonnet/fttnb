class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = current_user

  end

  def update
   current_user
   current_user.update(user_params)
   redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
