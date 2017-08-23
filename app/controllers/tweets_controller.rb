class TweetsController < ApplicationController

  def index
    @tweets = Tweet.order("created_at DESC")
  end

  def create
    Tweet.create(tweet_params)
  end

  def new
  end

  private
  def tweet_params
    params.permit(:name,:image,:text)
  end

end
