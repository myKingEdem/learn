require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger"
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    if message.length < 140
      @client.update(message)
    elsif message.length > 140
      puts "Tweet is too long! Only 140 chars."
    else
      @client.update(message)
    end
  end

  def dm(target, message)
    dm = "d #{target} #{message}"
    t_handles = @client.followers.collect { |f| f.screen_name }
    if t_handles.include?(target)
      tweet(dm)
    else
      puts "You can only send direct messages to followers!"
    end
  end

  def followers_list
    screen_names = []
    @client.followers.each { |f| screen_names << f.screen_name }
    screen_names
  end

  def spam_followers(message)
    followers_list.each { |screen_name| dm(screen_name, message) }
  end

  def friends_last_tweet
    friends = @client.friends
    friends.each { |f| f.screen_name.downcase! }
    friends.sort_by! { |a,b| b <=> a }
    friends.each do |friend|
      puts "#{ friend.status.from_user }"
      puts "#{ friend.status.text }"
      time_of_tweet = friend.status.created_at
      puts "#{ time_of_tweet.strftime('%A, %b, %d')}"
      puts ""
    end
  end

  def run
    puts "Welcome to JSL Twitter Client"
    command = ''
    while command != 'q'
      printf 'Enter message:'
      input = gets.chomp
      parts = input.split
      command = parts[0]
    case command
    when 'q' then puts 'Adios!'
    when 't'
      message = parts[1..-1].join(' ')
      tweet(message)
    when 'dm'
      target = parts[1]
      message = parts[2..-1].join(' ')
      dm(target, message)
    when 'spam'
      message = parts[1..-1].join(' ')
      spam_followers(message)
    when 'flt'
      friends_last_tweet
    else
      puts "Sorry I don't understand #{ command }"
      end   
    end
  end
end ##

if __FILE__ == $0
  blogger = MicroBlogger.new
  message1 = "#Hacking_away!#Incoming_spam!"
  message2 = message1.ljust(140,message1)
  message3 = message1.ljust(143,message1)

  blogger.tweet(message1)
  blogger.tweet(message3)
  blogger.tweet(message2)
end

