Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, '314835285775018', '9e22124397de09463dcc868dd696db72', {:client_options => { :ssl => { :ca_file => "#{Rails.root}/config/ca-bundle.crt" } } }
end