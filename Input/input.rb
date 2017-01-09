require 'colorize'
require_relative '../StopWords/stop_words'

class Input
  def self.get
    entered_name = Input.get_input
    stopwords_filter = StopWords.get
    filtered_name = stopwords_filter.filter (entered_name).split
    card_search_text = filtered_name.join(' ')
  end

  private
  
  # Get the card name that user intends to add
  def self.get_input
    puts "Enter the card name you were about to type: ".green
    gets.chomp
  end
end