class HomeController < ApplicationController
  def index
  	tweet = params[:tweet]
  	SendTweet.new(tweet).perform unless tweet == nil
  end
end