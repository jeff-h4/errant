class FriendshipsController < ApplicationController
  def create
    #@friendship = Friendship.new(params[:friendship])
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added Friend"
      redirect_to root_url
    else
      flash[:error] = "Problem adding friend"
      redirect_to root_url
    end
  end
  def index
    Rails.logger.debug("Index action called")
    @friends = current_user.friends
    if params[:search]
      @friend = User.search_emails(params[:search]).first
    end
  end

  def destroy
    #@friendship = Friendship.find(params[:id])
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Ditched Friend"
    redirect_to current_user
  end
end
