require 'trello'
Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_KEY'] # The "key" from step 1
  config.member_token = ENV['TRELLO_MEMBER'] # The token from step 3.
end
