class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def new
  end
  def create
    user = User.create(name:params[:Name], email:params[:Email], password:params[:Password])
    if user.errors.full_messages.empty?
      session[:user_id]=user.id
      redirect_to "/users/"+user.id.to_s
    else
      flash[:errors] = user.errors.full_messages
      redirect_to "/users/new"
    end
  end
  def show
    @user = User.find(params[:id])
    @secret = @user.secrets
  end
  def logout
    session[:user_id]=nil
    redirect_to '/sessions/new'
  end
  def edit
    @user= User.find(session[:user_id])
  end
  def update
    user = User.find(session[:user_id]).update(email:params[:Email], name:params[:Name])
    redirect_to '/users/'+session[:user_id].to_s
  end
  def destroy
    user = User.find(session[:user_id]).delete
    session[:user_id]=nil
    redirect_to '/sessions/new'

  end
end
