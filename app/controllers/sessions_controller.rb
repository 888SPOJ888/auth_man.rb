class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])

      session[:user_id] = user.id
      redirect_to root_path, notice: "Successfully logged in"
    else
      flash.now[:notice] = 'Invalid E-mail or password'
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
