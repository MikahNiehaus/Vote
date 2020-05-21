# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, '864096534100818', '76f35aef63cc98b1a3f3a1b5823c2cf7'
#   #  provider :facebook, '660506848136995', '01bd6a3de70551957289923b52b1701d'
#   end  

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']

  provider :github, '0ce5840b60df90e82a75', 'd2c0e94e820d2582da5205b6b269e6c5f484c318'
end
