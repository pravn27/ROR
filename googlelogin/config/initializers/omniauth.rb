OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1065710737758-g8e9t0a7afv885qrlr68hteog3allcjq.apps.googleusercontent.com', '6G3sNmYl1PcvgoPuPaZaIh2P', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end