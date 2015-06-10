class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      redirect_to :root, notice: "Signed up!"
    else
      redirect_to sign_up_path, notice: "There was an error. Please try again."
    end
  end

  def edit
    @user = User.find(params[:id])
    @user.role = "standard"      # Edit page will direct user to downgrade from premium
    @user.save
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :role)
  end

end
