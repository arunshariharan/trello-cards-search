class Output
  def self.display(result)
    if result.size > 0
      puts "\nWe found "+ result.size.to_s + " cards that are similar \n\n"
      result.each {|each_result| puts each_result + "\n"}
    else
      puts "\nNo cards match your title - Create a new one :)"
    end
  end
end