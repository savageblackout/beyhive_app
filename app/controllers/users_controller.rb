class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up to get in formation!"
      redirect_to root_path
    else
      render :new
  end
end

private

  def user_params
    params.require(:user).permit(:f_name, :l_name, :email, :password, :password_confirmation)
  end

  def authorize_modify_content
    if (current_user != User.find(params[:id])) && !current_user.is_admin
      redirect_to root_path
    end
  end

  def authorize_users_view
    if !current_user.is_admin
      redirect_to root_path
    end
  end

end
