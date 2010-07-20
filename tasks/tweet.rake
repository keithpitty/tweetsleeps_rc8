require 'rubygems'
require 'twitter'

namespace :tweet do
  
  desc "post a message about the number of days until rc8 (args: username)"
  task :sleeps, :username do |t, args|
    unless args.username
      raise "Please try again with the username e.g. rake tweet:sleeps[twitteruser]"
    end
    client(args.username).update(message) unless msg.blank?
  end
end

def client(username)
  Twitter::Base.new(Twitter::HTTPAuth.new(username, password_for(username)))
end

def message
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

def days_left
  (Date.parse("20101112") - Date.today).to_i
end

def random_msg
  "Railscamp 8: #{RandomMessage.generate}"
end