Rails.application.config.middleware.use OmniAuth::Builder do
  provider :salesforce, ENV['SALESFORCE_CONSUMER_KEY'], ENV['SALESFORCE_CONSUMER_SECRET']
end