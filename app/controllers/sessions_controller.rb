class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
      remember user
  		redirect_to user 
  	else
  	  render 'new'
  	  flash.now[:danger] = '間違っとるばい'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
