Rails.application.config.middleware.use OmniAuth::Builder do
  provider :trello, ENV['trello_key'], ENV['trello_secret'],
  app_name: "Now Showing", scope: 'read,write,account', expiration: 'never'
end
