# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  users = User.create([{:name => "Olena", :email => "olena@gmail.com"},
    {:name => "Ricky", :email => "rrzein@gmial.com"}])

  polls = Poll.create([{:creator_id => 1, :name => "Olena's poll"}, {:creator_id => 2, :name => "Ricky's poll"}])

  questions = Question.create([
    {:poll_id => 1, :body => "What is your favorite color?"},
    {:poll_id => 1, :body => "What is your favorite city?"},
    {:poll_id => 1, :body => "What is your favorite flower?"},

    {:poll_id => 2, :body => "What is your favorite season?"},
    {:poll_id => 2, :body => "Who is your favorite president?"},
    {:poll_id => 2, :body => "Do you like ice cream?"}
    ])

  allowed_responses = AllowedResponse.create([
    {:question_id => 1, :value => "Red"},
    {:question_id => 1, :value => "Blue"},
    {:question_id => 1, :value => "Green"},

    {:question_id => 2, :value => "San Francisco"},
    {:question_id => 2, :value => "Chicago"},
    {:question_id => 2, :value => "New York"},

    {:question_id => 3, :value => "Roses"},
    {:question_id => 3, :value => "Sunflowers"},
    {:question_id => 3, :value => "Daises"},

    {:question_id => 4, :value => "Summer"},
    {:question_id => 4, :value => "Spring"},
    {:question_id => 4, :value => "Autumn"},

    {:question_id => 5, :value => "Barack Obama"},
    {:question_id => 5, :value => "George W. Bush"},
    {:question_id => 5, :value => "Bill Clinton"},

    {:question_id => 6, :value => "Yes"},
    {:question_id => 6, :value => "No"},
  ])

  responses = Response.create([
    {:allowed_response_id => 1, :responder_id => 2},
    {:allowed_response_id => 4, :responder_id => 2},
    {:allowed_response_id => 7, :responder_id => 2},

    {:allowed_response_id => 10, :responder_id => 1},
    {:allowed_response_id => 13, :responder_id => 1},
    {:allowed_response_id => 16, :responder_id => 1},

  ])























