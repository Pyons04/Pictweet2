class TweetsController < ApplicationController

  before_action :move_to_index, except: :index


  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(1)
  end

  def create
    Tweet.create(image: tweet_params[:image],text:tweet_params[:text],user_id:current_usre.id)
  end

  def new
  end

  def move_to_index
     redirect_to action: :index unless user_signed_in?
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end


  def edit
     @tweet= Tweet.find(params[:id])
  end

  def update
     tweet = Tweet.find(params[:id])
     tweet.update(tweet_params)
  end

  private
  def tweet_params
    params.permit(:image,:text,)
  end

end
