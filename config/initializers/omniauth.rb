# Register your application with intended provider(i.e. Google, Facebook, GitHub, etc) and obtain your client_id and client_sec
Rails.application.config.middleware.use OmniAuth::Builder do
  # Within that block, you will tell OmniAuth which provider to work with.
  provider :github, '0ce5840b60df90e82a75', 'd2c0e94e820d2582da5205b6b269e6c5f484c318'
end
