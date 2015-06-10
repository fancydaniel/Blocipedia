class ChargesController < ApplicationController

  def create
    # raise
    @amount = 1500

    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      email:  current_user.email,
      card:   params[:stripeToken]    
      )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in app
      amount:   @amount,
      description: "Blocipedia Membership - #{current_user.email}",
      currency: 'usd'
      )

    flash[:success] = "Thanks you for your purchase, #{current_user.email}!" 

    p current_user.id
    current_user.update_attributes!( role: 'premium' )
    # @user = User.find(params[:user_id])  # Idea to upgrade role of user
    # @user.role = "premium"
    # @user.name = "Caitlyn Example"
    # @user.save
    # redirect_to current_user 

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This 'rescue block' carches and displays those errors.
  rescue Stripe::CardError => each 
    flash[:error] = e.message
    redirect_to charges_path
  end
  
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Blocipedia Membership - #{current_user}",
      amount: @amount
    }
  end
end
