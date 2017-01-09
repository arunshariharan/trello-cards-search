require_relative '../StopWords/stop_words'

class Populator
  attr_reader :current_member, :board_name, :current_board

  def initialize(member_name, board_name)
    @current_member = Trello::Member.find(member_name)
    @board_name = board_name
    @board_id = ''
    @total_lists, @card_list = [], []
    @stopwords_filter = StopWords.get
    set_current_board
  end  

  # Return all the lists in current board
  def populate_lists
    current_board.lists.each do |list|
      @total_lists << [list.name, list.id]
    end
    @total_lists
  end

  # Return all cards in the passed list
  def populate_cards(curated_lists)
    curated_lists.size.times do |time|
      list = Trello::List.find(curated_lists[time][1])
      list.cards.each do |card|
        card = card.name.gsub('>',' ')  #remove unnecessary symbols
        f = @stopwords_filter.filter (card).split  # filter with stopwords
        @card_list << [f.join(' '), list.name] # Add the filtered card to the card_list
      end
    end
    @card_list
  end

  private

  def set_current_board
    @current_board = Trello::Board.find(set_board_id)
  end

  def set_board_id
    current_member_boards = current_member.boards
    current_member_boards.each do |board|
      @board_id = board.id if board.name == board_name
    end
    @board_id
  end
end