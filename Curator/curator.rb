require_relative '../Configuration/user_configuration'

class Curator
  include UserConfiguration

  attr_reader :list_names_to_be_concentrated, :total_lists

  def initialize(total_lists)
    @total_lists = total_lists
    @list_names_to_be_concentrated = []
    @name_of_list_to_include = UserConfiguration.name_of_list_to_include
    @name_of_list_to_exclude = UserConfiguration.name_of_list_to_exclude
  end

  # Eg:  Get the lists that has the word 'bugs' in it (name_of_list_to_include)
  # And exclude the list that is "Fixed Bugs" (name_of_list_to_exclude)
  def curate_lists
    total_lists.each do |each_list|
      if (each_list[0].downcase.include? @name_of_list_to_include) && 
        !(each_list[0].downcase.include? @name_of_list_to_exclude)
        list_names_to_be_concentrated << each_list 
      end
    end
    list_names_to_be_concentrated
  end

end