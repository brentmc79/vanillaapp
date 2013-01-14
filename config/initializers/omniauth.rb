use OmniAuth::Builder do
  provider :twitter, ENV['VANILLA_TWITTER_KEY'], ENV['VANILLA_TWITTER_SECRET']
end
