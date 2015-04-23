class UserFriendshipsController < ApplicationController
  before_filter :authenticate_user!

  def new
    if params[:friend_id]
      @friend = User.where(profile_name: params[:friend_id]).first
      raise ActiveRecord::RecordNotFound if @friend.nil?
      @user_friendship = current_user.user_friendships.new(friend: @friend)
    else
      flash[:error] = "Friend required"
    end
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404', status: :not_found
  end

  def create
    if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
      @friend = User.where(profile_name: params[:user_friendship][:friend_id]).first
      @user_friendship = current_user.user_friendships.new(friend: @friend)
      @user_friendship.save
      flash[:success] = "You are now friends with #{@friend.full_name}"
      redirect_to profile_path(@friend)
    else
      flash[:error] = "Friend required"
      redirect_to root_path
    end
  end
end

private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def user_friendship_params
      params.require(:user_friendship).permit(:friend_id, :user_id, :profile_name, :state, :user_friendship, :friend, :users, :pending_user_friendship, :pending_friends)
    end
