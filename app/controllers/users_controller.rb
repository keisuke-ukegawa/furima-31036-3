class UsersController < ApplicationController
  def edit
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday)
  end
end
