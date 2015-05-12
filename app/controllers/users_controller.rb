class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      redirect_to :root, notice: "Signed up!"
    else
      redirect_to :root
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
