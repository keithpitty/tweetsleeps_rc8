require 'rubygems'
require 'twitter'

namespace :tweet do
  desc "post a test tweet (arg: username)"
  task :test, :username do |t, args|
    unless args.username
      raise "Please try again with the username e.g. rake tweet:test[twitteruser]"
    end
    client(args.username).update("Testing at #{Time.now} ...")
  end
  
  desc "post a message about the number of days until rc8 (args: username)"
  task :sleeps, :username do |t, args|
    unless args.username
      raise "Please try again with the username e.g. rake tweet:sleeps[twitteruser]"
    end
    client(args.username).update(message) unless msg.blank?
  end
  
  desc "test message"
  task :msg do
    msg = message
    puts msg
    puts "#{msg.length} chars long"
  end
end

def client(username)
  Twitter::Base.new(Twitter::HTTPAuth.new(username, password_for(username)))
end

def message
  days_left = days_until(Date.parse("20101112"))
  case 
  when days_left > 1
    "Only #{days_left} sleeps until #{random_msg} #rc8"
  when days_left == 1
    "Only one sleep until #{random_msg} #rc8"
  when days_left == 0
    "No more sleeps until #{random_msg} It's on today! #rc8"
  else
    nil
  end
end
    

def password_for(username)
  users = YAML::load_file(File.expand_path("~/.tweetsleeps/users.yml"))
  raise 'User not found!' unless users[username]
  users[username]
end

def days_until(event_date)
  (event_date - Date.today).to_i
end

def random_msg
  "Railscamp 8: #{RandomMessage.generate}"
end