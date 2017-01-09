class SimilarityMatcher
  attr_reader :card_list

  def initialize(card_list)
    @card_list = card_list
    @result = []
  end

  # Based on the passed in algorithm, return an array 
  # of searched and matched results
  def find_distance(algorithm, entered_name, similarity_value)
    case algorithm
    when 'levenshtein'
      find_levenshtein_distance(entered_name, similarity_value)
    else
      return nil
    end
  end

  private 

=begin 
  # Flow of this method
  # If a given card is >= similarity value AND
  # If the card contains words as entered by the user THEN
  # Add the card to the list of results.
  #
  # NOTE: Levenshtein values range from 0 to 1, 1 being exactly similar
=end

  def find_levenshtein_distance(entered_name, similarity_value)
    card_list.each do |each_card|
      length = 0
      if (each_card[0].levenshtein_similar(entered_name) >= similarity_value)
        entered_name.split(' ').each do |each_word|
          length += 1 if (each_card[0].split(' ').any? {|card_word| 
            card_word.include? each_word
            })
        end
        (@result << each_card[0] + " -- " + each_card[1].capitalize)  if length > 0
      end
    end
    @result
  end
end