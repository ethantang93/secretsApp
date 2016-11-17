class LikesController < ApplicationController
  def create
    @user = User.find(params[:userid])
    @secret = Secret.find(params[:secretid])
    like = Like.create(user:@user, secret:@secret)
    redirect_to :back
  end
  def destroy
    like = Like.where(user_id:params[:userid], secret_id:params[:secretid])
    puts like.destroy(like)
    redirect_to :back
  end
end
