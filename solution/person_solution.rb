require 'rubygems'
require 'minitest/autorun'
require 'mocha/mini_test'
require 'ostruct'

require_relative '../person'

class PersonTest < Minitest::Test
  def setup
    @person = Person.new('Lisa')
  end

  def test_say_hello
    assert_equal 'hello', @person.say_hello
  end

  def test_say_name
    assert_equal 'My name is Lisa.', @person.say_name
  end

  def test_add_friend
    # verify that we added a friend
    assert_equal(0, @person.send(:friends).size)
    @person.add_friend('Kelly')
    assert_equal(1, @person.send(:friends).size)
    kelly = @person.send(:friends).last

    # verify that the new Person's name is Kelly
    assert_equal('Kelly', kelly.name)
  end

  def test_remove_friend
    @person.add_friend('Kelly')
    assert_equal 1, @person.send(:friends).size

    @person.remove_friend('Kelly')
    assert_equal 0, @person.send(:friends).size
  end

  def test_friend_names__alphabetized
    @person.add_friend('b')
    @person.add_friend('c')
    @person.add_friend('a')

    assert_equal %w(a b c), @person.friend_names(reverse_alphabetical: false)
    assert_equal %w(c b a), @person.friend_names(reverse_alphabetical: true)
  end

  def test_say_hello_to_the_world
    MessageSender.expects(:say).with('Hello world!')
    @person.say_hello_to_the_world
  end

  def test_ping_friends
    dummy_response = mock
    dummy_response.expects(:online).returns(5)
    dummy_response.expects(:offline).returns(3)

    MessageSender.expects(:ping_friends).returns(dummy_response)

    r = { online: 5, offline: 3 }
    assert_equal r, @person.ping_friends
  end

  def test_send_message_to_all_friends__successful
    dummy_response = mock
    dummy_response.expects(:successfully_sent).returns(true)

    MessageSender.expects(:notify_friends).returns(dummy_response)
    Logger.expects(:log).with('successfully sent message')

    @person.send_message_to_all_friends
  end

  def test_send_message_to_all_friends__failure
    dummy_response = OpenStruct.new(successfully_sent: false)

    MessageSender.expects(:notify_friends).returns(dummy_response)
    Logger.expects(:log).with('failed to send')

    @person.send_message_to_all_friends
  end
end

def todo(n)
  puts "TODO #{n}".red
end
