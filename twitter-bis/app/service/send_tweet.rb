class SendTweet

	require "twitter"

	def initialize(string)
		@string = string
	end

	def perform
		log_in_to_twitter
		send_tweet
	end

	private
	def log_in_to_twitter
		@client = Twitter::REST::Client.new do |config|
			config.consumer_key        = Figaro.env.TWITTER_CONSUMER_KEY
			config.consumer_secret     = Figaro.env.TWITTER_CONSUMER_SECRET
			config.access_token        = Figaro.env.TWITTER_ACCESS_TOKEN
			config.access_token_secret = Figaro.env.TWITTER_ACCESS_TOKEN_SECRET
		end
	end

	def send_tweet
		@client.update(@string)
	end
end