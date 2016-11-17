class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:Email])
    if user && user.authenticate(params[:Password])
      session[:user_id]= user.id
      redirect_to "/users/"+user.id.to_s
    else
      flash[:errors]= ["Invalid combination"]
      redirect_to "/sessions/new"
    end
  end
end
