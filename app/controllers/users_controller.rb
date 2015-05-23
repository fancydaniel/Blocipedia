class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)


    if @user.save
      @user.role = User.set_as_standard
      UserMailer.registration_confirmation(@user).deliver
      redirect_to :root, notice: "Signed up!"
    else
      redirect_to sign_up_path, notice: "There was an error. Please try again."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end

end
