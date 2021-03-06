module TrelloConfiguration
  extend self
  
  # Enter Trello specific information here
  PUBLIC_KEY = 'YOUR PUBLIC KEY'
  MEMBER_TOKEN = 'YOUR MEMBER TOKEN'

  # Configure Trello keys and token
  def start
    Trello.configure do |config|
      config.developer_public_key = PUBLIC_KEY
      config.member_token = MEMBER_TOKEN
    end
  end
end
