# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Poll.destroy_all
Question.destroy_all
Answer.destroy_all
Response.destroy_all

User.create([{username: "Abdul"}, {username: "Steve"}, {username: "John"}])
Poll.create([{title: 'Whats up?', user_id: 1}, {title: 'How are you?',
  user_id: 2}])
Question.create([{question: 'How are you?', poll_id: 1},
  {question: 'Do you like movies?', poll_id: 1},
  {question: 'Whats going on?', poll_id: 2}, {question: 'Do you like ice cream',
  poll_id: 2}])
Answer.create([{question_id: 1, answer: 'Same old'}, {question_id: 1,
  answer: 'Good'}, {question_id: 1, answer: 'Not well'},
  {question_id: 2, answer: 'Nope'},{question_id: 2, answer: 'On occasion'},
  {question_id: 2, answer: 'Of course'},
  {question_id: 3, answer: 'Chillin'}, {question_id: 3, answer: 'Nothing'},
  {question_id: 3, answer: 'Same ol'},
  {question_id: 4, answer: 'I hate it'}, {question_id: 4, answer: 'Sometimes'},
  {question_id: 4, answer: 'LOVE IT'}])
Response.create([{user_id: 1, answer_id: 7}, {user_id: 1, answer_id: 12},
  {user_id: 2, answer_id: 1}, {user_id: 2, answer_id: 5}])
