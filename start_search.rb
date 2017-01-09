require 'pp' 
require 'trello'
require 'stopwords'
require 'net/http'
require 'amatch'

require_relative 'Configuration/trello_configuration'
require_relative 'Configuration/user_configuration'
require_relative 'Input/input'
require_relative 'Populator/populator'
require_relative 'Curator/curator'
require_relative 'Matcher/similarity_matcher'
require_relative 'Output/output'

include UserConfiguration
include TrelloConfiguration

# Set required data and configure Trello
UserConfiguration.set_data
TrelloConfiguration.start

# Retrieve variables to pass onto different classes
member_name = UserConfiguration.member_name
board_name = UserConfiguration.board_name
similarity_value = UserConfiguration.similarity_value
entered_name = Input.get

# Ask Populator to set the right board
populator = Populator.new(member_name, board_name)

# Populate lists in the selected board
total_lists = populator.populate_lists

# Exclude unwanted lists
curator = Curator.new(total_lists)
curated_lists = curator.curate_lists

# Populate cards from selected lists
card_list = populator.populate_cards(curated_lists)

# Match entered text with curated cards using a similarity matching
# Algorithm - here I am passing Levenshtein
matcher = SimilarityMatcher.new(card_list)
result = matcher.find_distance('levenshtein', entered_name, similarity_value)

# Display result to the user
Output.display(result)