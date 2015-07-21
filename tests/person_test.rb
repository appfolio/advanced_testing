require 'rubygems'
require 'minitest/autorun'
require 'mocha/mini_test'
require_relative '../person'

class PersonTest < Minitest::Test
  def setup
    @person = Person.new('Lisa')
  end

  def test_say_hello
    assert_equal 'hello', @person.say_hello
  end

  def test_say_name
    todo(1)
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
    todo(2)
  end

  def test_friend_names__alphabetized
    todo(3)
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
    todo(4)
  end

  def test_send_message_to_all_friends__failure
    todo(5)
  end
end
