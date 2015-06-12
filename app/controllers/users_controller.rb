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

  def downgrade
    current_user.update_attributes!( role: 'standard' )
    # add a flash notice
    redirect_to account_users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :role)
  end

end
