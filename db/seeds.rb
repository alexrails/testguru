# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
  { first_name: 'Alex', last_name: 'Korzun', email: 'alex@gmail.com', password: 'password' },
  { first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password', type: 'Admin' },
  { first_name: 'Johana', last_name: 'Ivkis', email: 'johana@yahoo.com', password: 'password' }
])

categories = Category.create!([
  { title: 'Backend' },
  { title: 'Frontend' },
  { title: 'Database' }
])

tests = Test.create!([
  { title: 'Ruby', level: 5, category_id: categories[0].id, user_id: users[0].id },
  { title: 'HTML', level: 1, category_id: categories[1].id, user_id: users[0].id },
  { title: 'Postresql', level: 7, category_id: categories[2].id, user_id: users[1].id },
  { title: 'Javascript', level: 5, category_id: categories[1].id, user_id: users[2].id }
])

questions = Question.create!([
  { body: 'What is the result of expression: "".nil?', test_id: tests[0].id },
  { body: 'Do all HTML tags come in a pair?', test_id: tests[1].id },
  { body: 'What is the class of Object class?', test_id: tests[0].id },
  { body: 'What is the maximum size of the table in Postgresql?', test_id: tests[2].id },
  { body: 'Which company developed Javascript?', test_id: tests[3].id }
])

answers = Answer.create!([
  { body: 'false', correct: true, question_id: questions[0].id },
  { body: 'true', correct: false, question_id: questions[0].id },
  { body: 'No', correct: true, question_id: questions[1].id },
  { body: 'Yes', correct: false, question_id: questions[1].id },
  { body: 'Class', correct: true, question_id: questions[2].id },
  { body: 'BasicObject', correct: false, question_id: questions[2].id },
  { body: '32 TB', correct: true, question_id: questions[3].id },
  { body: 'No limit', correct: false, question_id: questions[3].id },
  { body: 'Netscape', correct: true, question_id: questions[4].id },
  { body: 'IBA', correct: false, question_id: questions[4].id }
])

user_passed_tests = UserPassedTest.create!([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[0].id, test_id: tests[3].id },
  { user_id: users[2].id, test_id: tests[3].id }
])
