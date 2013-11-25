require 'json'


testjsonglobal = '[{"response": {"user_id": 4, "created_at": "2013-11-23T13:05:46", "updated_at": "2013-11-23T16:37:52-08:00", "value": "", "updated_at_epoch": 1385253472, "lesson_name": "Lesson 1", "id": 0, "created_at_epoch": 1385240746, "question_id": -1, "user_name": "Miles Wyman", "correct": "", "lesson_id": 1}}, {"response": {"user_id": 5, "created_at": "2013-11-23T13:06:50", "updated_at": "2013-11-23T16:37:53-08:00", "value": "", "updated_at_epoch": 1385253473, "lesson_name": "Lesson 3", "id": 1, "created_at_epoch": 1385240810, "question_id": -1, "user_name": "Darrell Powlowski", "correct": "True", "lesson_id": 3}}, {"response": {"user_id": 2, "created_at": "2013-11-23T13:12:13", "updated_at": "2013-11-23T16:37:52-08:00", "value": "", "updated_at_epoch": 1385253472, "lesson_name": "Lesson 1", "id": 2, "created_at_epoch": 1385241133, "question_id": -1, "user_name": "Vladimir Murray", "correct": "True", "lesson_id": 1}}, {"response": {"user_id": 3, "created_at": "2013-11-23T13:13:38", "updated_at": "2013-11-23T16:37:52-08:00", "value": "", "updated_at_epoch": 1385253472, "lesson_name": "Lesson 3", "id": 3, "created_at_epoch": 1385241218, "question_id": -1, "user_name": "Verna Pacocha", "correct": "", "lesson_id": 3}}, {"response": {"user_id": 1, "created_at": "2013-11-23T13:14:36", "updated_at": "2013-11-23T16:37:52-08:00", "value": "", "updated_at_epoch": 1385253472, "lesson_name": "Lesson 2", "id": 4, "created_at_epoch": 1385241276, "question_id": -1, "user_name": "Kamren Runolfsdottir", "correct": "", "lesson_id": 2}}, {"response": {"correct": "True", "user_id": 5, "lesson_name": "Lesson 3", "created_at": "2013-11-23T13:24:50", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 3, Q3", "updated_at_epoch": 1385253473, "lesson_id": 3, "created_at_epoch": 1385241890, "user_name": "Darrell Powlowski", "id": 5, "question_id": 24}}, {"response": {"correct": "False", "user_id": 5, "lesson_name": "Lesson 2", "created_at": "2013-11-23T13:29:43", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 2, Q4", "updated_at_epoch": 1385253472, "lesson_id": 2, "created_at_epoch": 1385242183, "user_name": "Darrell Powlowski", "id": 6, "question_id": 3}}, {"response": {"correct": "False", "user_id": 4, "lesson_name": "Lesson 1", "created_at": "2013-11-23T13:35:24", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253472, "lesson_id": 1, "created_at_epoch": 1385242524, "user_name": "Miles Wyman", "id": 7, "question_id": 18}}, {"response": {"correct": "False", "user_id": 3, "lesson_name": "Lesson 3", "created_at": "2013-11-23T13:41:06", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 3, Q3", "updated_at_epoch": 1385253472, "lesson_id": 3, "created_at_epoch": 1385242866, "user_name": "Verna Pacocha", "id": 8, "question_id": 4}}, {"response": {"correct": "True", "user_id": 4, "lesson_name": "Lesson 1", "created_at": "2013-11-23T13:41:16", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253472, "lesson_id": 1, "created_at_epoch": 1385242876, "user_name": "Miles Wyman", "id": 9, "question_id": 1}}, {"response": {"correct": "True", "user_id": 2, "lesson_name": "Lesson 1", "created_at": "2013-11-23T13:53:30", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253472, "lesson_id": 1, "created_at_epoch": 1385243610, "user_name": "Vladimir Murray", "id": 10, "question_id": 5}}, {"response": {"correct": "False", "user_id": 3, "lesson_name": "Lesson 2", "created_at": "2013-11-23T13:53:47", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 2, Q4", "updated_at_epoch": 1385253472, "lesson_id": 2, "created_at_epoch": 1385243627, "user_name": "Verna Pacocha", "id": 11, "question_id": 16}}, {"response": {"correct": "False", "user_id": 3, "lesson_name": "Lesson 3", "created_at": "2013-11-23T14:03:40", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 3, Q3", "updated_at_epoch": 1385253473, "lesson_id": 3, "created_at_epoch": 1385244220, "user_name": "Verna Pacocha", "id": 13, "question_id": 28}}, {"response": {"correct": "False", "user_id": 5, "lesson_name": "Lesson 1", "created_at": "2013-11-23T14:09:12", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253472, "lesson_id": 1, "created_at_epoch": 1385244552, "user_name": "Darrell Powlowski", "id": 14, "question_id": 18}}, {"response": {"correct": "False", "user_id": 4, "lesson_name": "Lesson 3", "created_at": "2013-11-23T14:12:20", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 3, Q3", "updated_at_epoch": 1385253472, "lesson_id": 3, "created_at_epoch": 1385244740, "user_name": "Miles Wyman", "id": 16, "question_id": 9}}, {"response": {"correct": "True", "user_id": 3, "lesson_name": "Lesson 4", "created_at": "2013-11-23T14:14:02", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 4, Q2", "updated_at_epoch": 1385253472, "lesson_id": 2, "created_at_epoch": 1385244842, "user_name": "Verna Pacocha", "id": 17, "question_id": 13}}, {"response": {"correct": "True", "user_id": 5, "lesson_name": "Lesson 2", "created_at": "2013-11-23T14:14:45", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 2, Q4", "updated_at_epoch": 1385253472, "lesson_id": 4, "created_at_epoch": 1385244885, "user_name": "Darrell Powlowski", "id": 19, "question_id": 3}}]'

  
  
  
get '/' do
  @students=User.where(role: "student")
  @questions = Question.all
  @responses = Response.all
  @lessons= Lesson.all
     erb :index
end

get '/sa_responses' do

     responses = Response.includes(:user, :question)

     expanded_reponse = responses.map do |r|
          {response: {user_id: r.user_id, 
          first_name: r.user.first_name, 
          last_name: r.user.last_name, 
          question_id: r.question_id,
          question_text: r.question.text, 
          response_id: r.id,
          value: r.value,
          created_at: r.created_at,
          created_at_epoch: r.created_at.to_i}}
     end

     p expanded_reponse.to_json
end

get '/responses' do

   @responses = Response.all

  # if xhr
   content_type :json
  @responses.to_json
  # end
 
end

get '/questions' do

  @questions = Question.all
  content_type :json
  @questions.to_json
 
end

get '/students' do

  @students = User.where(role: "student")
  content_type :json
  @students.to_json
 
end

get '/test' do
  erb :test
end

get '/responses1' do
  testjson = JSON.parse(testjsonglobal)
  content_type :json
  testjson = testjson.map { |x| x["response"] }
  testjson.to_json

end
