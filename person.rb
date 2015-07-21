require 'ostruct'
require_relative 'third_party'

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
    @friends = []
  end

  def say_hello
    'hello'
  end

  def say_name
    "My name is #{@name}."
  end

  def add_friend(friend_name)
    friends << Person.new(friend_name)
  end

  def remove_friend(friend_name)
    friends.delete(Person.new(friend_name))
  end

  # friend names should default to alphabetical order
  def friend_names(reverse_alphabetical: false)
    names = friends.map(&:name).sort
    reverse_alphabetical ? names.reverse : names
  end

  def say_hello_to_the_world
    MessageSender.say('Hello world!')
  end

  def ping_friends
    friends_status = MessageSender.ping_friends(friends)
    { online: friends_status.online, offline: friends_status.offline }
  end

  def send_message_to_all_friends
    # These classes are from a third party library and do magical things.
    # This makes it hard to test!

    response_code = MessageSender.notify_friends(friends, 'This is a call to all my resignations')

    if response_code.successfully_sent
      Logger.log('successfully sent message')
    else
      Logger.log('failed to send')
    end
  end

  def ==(other)
    name == other.name
  end

  def <=>(other)
    name <=> other.name
  end

  private

  def friends
    @friends ||= []
  end
end

def todo(n)
  puts "TODO #{n}"
end
