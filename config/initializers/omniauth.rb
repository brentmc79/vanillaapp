OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TASKER_TWITTER_KEY'], ENV['TASKER_TWITTER_SECRET']
end
