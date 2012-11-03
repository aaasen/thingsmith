Rails.configuration.DAILYCRED_CLIENT_ID = "b03691e9-8235-4642-b0f3-d7618ae3107e"
Rails.configuration.DAILYCRED_SECRET_KEY = "72ccb808-ebe2-447b-98ea-40dd506e44ef-002401c7-2c64-4426-b05e-fc391de36ff1"

dc_id = Rails.configuration.DAILYCRED_CLIENT_ID
dc_secret = Rails.configuration.DAILYCRED_SECRET_KEY

dc_options = { :client_options => {} }

if File.exists?('/etc/ssl/certs')
  dc_options[:client_options][:ssl] = { :ca_path => '/etc/ssl/certs'}
end
if File.exists?('/opt/local/share/curl/curl-ca-bundle.crt')
  dc_options[:client_options][:ssl] = { :ca_file => '/opt/local/share/curl/curl-ca-bundle.crt' }
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dailycred, dc_id, dc_secret, dc_options
end

Rails.application.config.middleware.use "Dailycred::Middleware", dc_id