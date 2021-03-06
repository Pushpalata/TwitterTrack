class MessagesController < ApplicationController

  respond_to :html, :js
  
  def index
    @tweets = Message.fetch_tweets(params[:term]) if params[:term].present?
  end

  def compare_tweet
    @tweet1s = Message.fetch_tweets(params[:term1]) if params[:term1].present?
    @tweet2s = Message.fetch_tweets(params[:term2]) if params[:term2].present?
  end

  def profile
    @user = Message.get_user(params[:term]) if params[:term].present?
  end
  
  def trending
    @trends = Message.trending(params[:woeid]) if params[:woeid].present?
    render 'index'
  end
  
end
