class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def index
    @secrets = Secret.all
    @created_secret_id = User.find(session[:user_id]).secrets.collect { |secret| secret.id}
  end

  def new
  end

  def create
    user = User.find(session[:user_id])
    secret = user.secrets.create(content:params[:NewSecret])
    if secret.errors.full_messages.empty?
      redirect_to '/users/'+session[:user_id].to_s
    else
      redirect_to '/users/'+session[:user_id].to_s
    end
  end

  def destroy
    secret = Secret.find(params[:id])
    secret.destroy if secret.user == current_user
    redirect_to '/users/'+session[:user_id].to_s
  end
end
