# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'Programming' }, { title: 'Auto' },
                 { title: 'Music' }, { title: 'Movies' }])
=begin
programming_id = Category.find_by(title: 'Programming').id
auto_id = Category.find_by(title: 'Auto').id
music_id = Category.find_by(title: 'Music').id
movies_id = Category.find_by(title: 'Movies').id
=end

tests = Test.create!([{ title: 'HTML', category_id: categories[0].id, level: 0 },
                      { title: 'Ruby', category_id: categories[0].id, level: 1 },
                      { title: 'RoR', category_id: categories[0].id, level: 1 },
                      { title: 'Manufacturers', category_id: categories[1].id, level: 0 },
                      { title: 'Autosport', category_id: categories[1].id, level: 2 },
                      { title: 'Music history', category_id: categories[2].id, level: 2 },
                      { title: 'Musical instruments', category_id: categories[2].id, level: 1 },
                      { title: 'Movies history', category_id: categories[3].id, level: 1 },
                      { title: 'Actors', category_id: categories[3].id, level: 0 }])

users = User.create!([{ username: 'Luke' }, { username: 'Han' },
                      { username: 'Lea' }, { username: 'Lando' }])

questions = Question.create!([{ body: 'What abbreviation HTML means?', test_id: tests[0].id },
                              { body: "Who is 'Matz'?", test_id: tests[1].id },
                              { body: 'When ruby language was created?', test_id: tests[1].id },
                              { body: 'What is Rails?', test_id: tests[2].id },
                              { body: 'Who created Rails?', test_id: tests[2].id },
                              { body: 'Which tag used for a paragraph?', test_id: tests[0].id },
                              { body: 'What tag <a> for?', test_id: tests[0].id },
                              { body: 'In which city BMW is located?', test_id: tests[3].id },
                              { body: 'Which F1 team is most successful?', test_id: tests[4].id },
                              { body: 'Most powerful road legal car in the world?', test_id: tests[3].id },
                              { body: 'Fastest F1 pit stop', test_id: tests[4].id },
                              { body: 'Nürburgring lap record?', test_id: tests[4].id },
                              { body: 'Largest music festival', test_id: tests[5].id },
                              { body: 'Band who released the most studio albums', test_id: tests[5].id },
                              { body: 'Loudest musical instrument', test_id: tests[6].id },
                              { body: 'Which instrument has the most strings', test_id: tests[6].id },
                              { body: 'First color movie was created in?', test_id: tests[7].id },
                              { body: 'Who was the first movie star', test_id: tests[7].id },
                              { body: 'First Johnny Depp movie', test_id: tests[8].id },
                              { body: "Hollywood actors who've appeared in the most movies", test_id: tests[8].id },])

answers = Answer.create!([{ body: 'HyperText Markup Language', question_id: questions[0].id, correct: true },
                          { body: 'Hierarchy Transfer Method Language', question_id: questions[0].id, correct: false },
                          { body: 'Handsome Tag Markup Language', question_id: questions[0].id, correct: false },
                          { body: 'Matz Mikkelsen, Hollywood actor', question_id: questions[1].id, correct: false },
                          { body: 'Yukihiro Matsumoto, Ruby language creator', question_id: questions[1].id, correct: true },
                          { body: 'Steven Matz, MLB player', question_id: questions[1].id, correct: false },
                          { body: '1995', question_id: questions[2].id, correct: true },
                          { body: '1993', question_id: questions[2].id, correct: false },
                          { body: '1996', question_id: questions[2].id, correct: false },
                          { body: 'A web-application framework', question_id: questions[3].id, correct: true },
                          { body: 'A programming language', question_id: questions[3].id, correct: false },
                          { body: 'A web-site generator tool', question_id: questions[3].id, correct: false },
                          { body: 'David Heinemeier Hansson', question_id: questions[4].id, correct: true },
                          { body: 'Yukihiro Matsumoto', question_id: questions[4].id, correct: false },
                          { body: 'Daniel Kaufman', question_id: questions[4].id, correct: false },
                          { body: '<p> tag', question_id: questions[5].id, correct: true },
                          { body: '<article> tag', question_id: questions[5].id, correct: false },
                          { body: '<quote> tag', question_id: questions[5].id, correct: false },
                          { body: 'New line', question_id: questions[6].id, correct: false },
                          { body: 'Comment', question_id: questions[6].id, correct: false },
                          { body: 'Link', question_id: questions[6].id, correct: true },
                          { body: 'München', question_id: questions[7].id, correct: true },
                          { body: 'Berlin', question_id: questions[7].id, correct: false },
                          { body: 'Köln', question_id: questions[7].id, correct: false },
                          { body: 'McLaren', question_id: questions[8].id, correct: false },
                          { body: 'Ferrari', question_id: questions[8].id, correct: true },
                          { body: 'Red Bull', question_id: questions[8].id, correct: false },
                          { body: 'Ferrari SF90 Stradale', question_id: questions[9].id, correct: false },
                          { body: 'Pininfarina Battista', question_id: questions[9].id, correct: true },
                          { body: 'Bugatti Chiron', question_id: questions[9].id, correct: false },
                          { body: 'Less than 3 seconds', question_id: questions[10].id, correct: false },
                          { body: 'Less than 5 seconds', question_id: questions[10].id, correct: false },
                          { body: 'Less than 5 seconds', question_id: questions[10].id, correct: true },
                          { body: 'Suzuka Circuit', question_id: questions[11].id, correct: false },
                          { body: 'Silverstone', question_id: questions[11].id, correct: false },
                          { body: 'Nürburgring', question_id: questions[11].id, correct: true },
                          { body: 'Summerfest', question_id: questions[12].id, correct: false },
                          { body: 'Mawazine', question_id: questions[12].id, correct: true },
                          { body: 'Rock in Rio', question_id: questions[12].id, correct: false },
                          { body: 'The Rolling Stones', question_id: questions[13].id, correct: false },
                          { body: 'Hawkwind', question_id: questions[13].id, correct: true },
                          { body: 'Motörhead', question_id: questions[13].id, correct: false },
                          { body: 'Trombone', question_id: questions[14].id, correct: false },
                          { body: 'Violin', question_id: questions[14].id, correct: false },
                          { body: 'Organ', question_id: questions[14].id, correct: true },
                          { body: 'Double bass', question_id: questions[15].id, correct: false },
                          { body: 'Piano', question_id: questions[15].id, correct: true },
                          { body: 'Harp', question_id: questions[15].id, correct: false },
                          { body: '1935', question_id: questions[16].id, correct: true },
                          { body: '1931', question_id: questions[16].id, correct: false },
                          { body: '1946', question_id: questions[16].id, correct: false },
                          { body: 'Charles Chaplin', question_id: questions[17].id, correct: false },
                          { body: 'Mary Pickford', question_id: questions[17].id, correct: false },
                          { body: 'Florence Annie Bridgwood', question_id: questions[17].id, correct: true },
                          { body: 'A Nightmare on Elm Street', question_id: questions[18].id, correct: true },
                          { body: 'Platoon', question_id: questions[18].id, correct: false },
                          { body: 'Edward Scissorhands', question_id: questions[18].id, correct: false },
                          { body: 'Michael Caine', question_id: questions[19].id, correct: true },
                          { body: 'Anthony Hopkins', question_id: questions[19].id, correct: false },
                          { body: 'Samuel L. Jackson', question_id: questions[19].id, correct: false },])

