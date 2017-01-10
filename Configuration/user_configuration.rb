module UserConfiguration
  extend self

  attr_reader :member_name, :board_name, :name_of_list_to_include
  attr_reader :name_of_list_to_exclude, :similarity_value

  # Enter user details here
  MEMBER_NAME = ''
  BOARD_NAME = 'Valuation QA All-in'
  NAME_OF_LIST_TO_INCLUDE = 'bugs'
  NAME_OF_LIST_TO_EXCLUDE = 'fixed'
  SIMILARITY_VALUE = 0.25

  def set_data
    @member_name = MEMBER_NAME
    @board_name = BOARD_NAME
    @name_of_list_to_include = NAME_OF_LIST_TO_INCLUDE
    @name_of_list_to_exclude = NAME_OF_LIST_TO_EXCLUDE
    @similarity_value = SIMILARITY_VALUE
  end
end