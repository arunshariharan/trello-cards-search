require 'ruby-progressbar'
require 'colorize'

class Output
  def self.display(result)
    if result.size > 0
      puts "\n\n"
      puts "We found ".yellow + result.size.to_s.red + " cards that are similar \n\n".yellow
      result.each {|each_result| puts each_result.green + "\n"}
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
      sleep(1) if progressbar.progress > 90
      sleep(0.10)
    end
    puts "\n"
    progressbar.finish    
  end
end