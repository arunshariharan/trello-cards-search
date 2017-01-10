require 'ruby-progressbar'
require 'colorize'

class Output
  def self.display(result)
    if result.size > 0
      puts "\n\n"
      puts "We found ".yellow + result.size.to_s.red + " cards that are similar \n\n".yellow
      result.each {|each_result| puts each_result[1].green + ' -- ' + each_result[0].green + "\n"}
    else
      puts "\n\n"
      puts "No cards match your title - Create a new one :)".green
    end
  end

  def self.display_wait_message
    # puts "\n"
    # print 'Your request is being processed. Please wait'
  end

  def self.display_progress(status)
    value = Random.new
    rand_value = value.rand(40..70)
    puts "\n"
    progressbar = ProgressBar.create(format:  '%t %p%%'.green, title: 'Complete -'.yellow, starting_at: rand_value, auto_finish: false)
    until  status.result == true
      progressbar.increment
      sleep(1) if progressbar.progress > 80
      sleep(0.10)
    end
    puts "\n"
    progressbar.finish    
  end

  def self.display_hash(result)
    puts "\n\n"
    puts "We found ".yellow + result.size.to_s.red + " cards that are similar \n\n".yellow
    File.open('Valuation_bugs.txt', 'w') { |file|
      result.each do |key, value|
        file.write("\n")
        file.write(key)
        file.write("\n")
        file.write("--------------")
        file.write("\n")
        value.each {|each_value| 
          file.write(each_value)
          file.write("\n") 
        }
      end  
    }
    
  end
end