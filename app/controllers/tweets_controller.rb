class TweetsController < ApplicationController
  skip_before_action :require_login, only: :index
  before_action :set_tweet, only: [:show, :destroy]

  def index
    @tweet = Tweet.new
    @tweets = Tweet.order(created_at: :desc).page(params[:page])

    respond_to { |format| format.js } if request.xhr?
  end

  def show; end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.author_id = current_user.id

    if @tweet.save
      flash[:notice] = 'Tweeet posted successfully!'
    else
      flash[:alert] = @tweet.errors.full_messages.join(', ')
    end

    redirect_to root_path
  end

  def destroy
    @tweet.destroy!
    flash[:notice] = 'Tweet successfully deleted!'

    redirect_to root_path
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
