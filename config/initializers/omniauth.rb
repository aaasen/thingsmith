Rails.configuration.DAILYCRED_CLIENT_ID = "b03691e9-8235-4642-b0f3-d7618ae3107e"
Rails.configuration.DAILYCRED_SECRET_KEY = "72ccb808-ebe2-447b-98ea-40dd506e44ef-002401c7-2c64-4426-b05e-fc391de36ff1"

dc_options = {
  :verbose => true,
  :after_auth => '/',
  :after_unauth => '/'
}

Rails.configuration.DAILYCRED_OPTIONS = dc_options