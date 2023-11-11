class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    #if user exists and password entered is correct
    if user && user.authenticate(params[:password])
      #save user id inside browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/sessions/new'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end
  
end
