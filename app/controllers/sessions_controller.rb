class SessionsController < ApplicationController
  def new
  end

  def login
    user = User.find_by(email: params[:email])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Invalid email"
      render :new
    end
  end
end
