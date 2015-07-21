# Intro to testing

This repo is for the 'Intro to testing' AF academy session.

## Setup
Clone the repo on your machine:

```
git clone git@github.com:appfolio/intro_to_testing.git
```

Make sure minitest and mocha are installed and if not install them:

```
gem install minitest
gem install mocha
```

## What to do
There is a `Person` class with a few methods in `src/person.rb`. It is a simple class representing a person, with a few methods.

Your job is to write tests for these methods. Some tests have already been written, and 5 still have to be written. Write those.

To run the test, type this command from the root directory.

```
ruby tests/person_test.rb
```

## Resources

Here is a link to the presentation: https://docs.google.com/presentation/d/1vtuxii4rqyKG7AWcA5Oa-Qe0Em7ylh1IIxsrfNEZ9Ms/edit#slide=id.p

The minitest documentation:
* https://github.com/seattlerb/minitest
* http://ruby-doc.org/stdlib-1.9.3/libdoc/minitest/unit/rdoc/MiniTest/Assertions.html

The mocha documentation:
* https://github.com/freerange/mocha
