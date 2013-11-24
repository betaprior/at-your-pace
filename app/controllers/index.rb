require 'json'
testjsonglobal = '[{"response": {"user_id": 2, "created_at": "2013-11-23T13:05:49", "updated_at_epoch": 1385253472, "value": "", "updated_at": "2013-11-23T16:37:52-08:00", "lesson_name": "Lesson 4", "created_at_epoch": 1385240749, "question_id": -1, "user_name": "Student B", "id": 0, "lesson_id": 4}}, {"response": {"user_id": 5, "created_at": "2013-11-23T13:06:41", "updated_at_epoch": 1385253473, "value": "", "updated_at": "2013-11-23T16:37:53-08:00", "lesson_name": "Lesson 2", "created_at_epoch": 1385240801, "question_id": -1, "user_name": "Student E", "id": 1, "lesson_id": 2}}, {"response": {"user_id": 3, "created_at": "2013-11-23T13:08:02", "updated_at_epoch": 1385253472, "value": "", "updated_at": "2013-11-23T16:37:52-08:00", "lesson_name": "Lesson 1", "created_at_epoch": 1385240882, "question_id": -1, "user_name": "Student C", "id": 2, "lesson_id": 1}}, {"response": {"user_id": 4, "created_at": "2013-11-23T13:10:02", "updated_at_epoch": 1385253473, "value": "", "updated_at": "2013-11-23T16:37:53-08:00", "lesson_name": "Lesson 4", "created_at_epoch": 1385241002, "question_id": -1, "user_name": "Student D", "id": 3, "lesson_id": 4}}, {"response": {"user_id": 1, "created_at": "2013-11-23T13:14:26", "updated_at_epoch": 1385253473, "value": "", "updated_at": "2013-11-23T16:37:53-08:00", "lesson_name": "Lesson 2", "created_at_epoch": 1385241266, "question_id": -1, "user_name": "Student A", "id": 4, "lesson_id": 2}}, {"response": {"user_id": 3, "lesson_name": "Lesson 1", "created_at": "2013-11-23T13:15:47", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253472, "lesson_id": 1, "created_at_epoch": 1385241347, "user_name": "Student C", "id": 5, "question_id": 15}}, {"response": {"user_id": 5, "lesson_name": "Lesson 2", "created_at": "2013-11-23T13:19:22", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 2, Q2", "updated_at_epoch": 1385253473, "lesson_id": 2, "created_at_epoch": 1385241562, "user_name": "Student E", "id": 6, "question_id": 25}}, {"response": {"user_id": 4, "lesson_name": "Lesson 4", "created_at": "2013-11-23T13:20:08", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 4, Q4", "updated_at_epoch": 1385253473, "lesson_id": 4, "created_at_epoch": 1385241608, "user_name": "Student D", "id": 7, "question_id": 22}}, {"response": {"user_id": 1, "lesson_name": "Lesson 2", "created_at": "2013-11-23T13:23:47", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 2, Q2", "updated_at_epoch": 1385253473, "lesson_id": 2, "created_at_epoch": 1385241827, "user_name": "Student A", "id": 8, "question_id": 23}}, {"response": {"user_id": 5, "lesson_name": "Lesson 1", "created_at": "2013-11-23T13:25:06", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253472, "lesson_id": 1, "created_at_epoch": 1385241906, "user_name": "Student E", "id": 9, "question_id": 5}}, {"response": {"user_id": 3, "lesson_name": "Lesson 2", "created_at": "2013-11-23T13:25:57", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 2, Q2", "updated_at_epoch": 1385253473, "lesson_id": 2, "created_at_epoch": 1385241957, "user_name": "Student C", "id": 10, "question_id": 26}}, {"response": {"user_id": 5, "lesson_name": "Lesson 2", "created_at": "2013-11-23T13:30:22", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 2, Q2", "updated_at_epoch": 1385253473, "lesson_id": 2, "created_at_epoch": 1385242222, "user_name": "Student E", "id": 11, "question_id": 19}}, {"response": {"user_id": 1, "lesson_name": "Lesson 3", "created_at": "2013-11-23T13:31:39", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 3, Q3", "updated_at_epoch": 1385253472, "lesson_id": 3, "created_at_epoch": 1385242299, "user_name": "Student A", "id": 12, "question_id": 2}}, {"response": {"user_id": 5, "lesson_name": "Lesson 1", "created_at": "2013-11-23T13:31:54", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253473, "lesson_id": 1, "created_at_epoch": 1385242314, "user_name": "Student E", "id": 13, "question_id": 20}}, {"response": {"user_id": 1, "lesson_name": "Lesson 1", "created_at": "2013-11-23T13:32:18", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253472, "lesson_id": 1, "created_at_epoch": 1385242338, "user_name": "Student A", "id": 14, "question_id": 12}}, {"response": {"user_id": 1, "lesson_name": "Lesson 4", "created_at": "2013-11-23T13:33:58", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 4, Q4", "updated_at_epoch": 1385253473, "lesson_id": 4, "created_at_epoch": 1385242438, "user_name": "Student A", "id": 15, "question_id": 22}}, {"response": {"user_id": 5, "lesson_name": "Lesson 3", "created_at": "2013-11-23T13:37:27", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 3, Q3", "updated_at_epoch": 1385253472, "lesson_id": 3, "created_at_epoch": 1385242647, "user_name": "Student E", "id": 16, "question_id": 3}}, {"response": {"user_id": 3, "lesson_name": "Lesson 3", "created_at": "2013-11-23T13:41:35", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 3, Q3", "updated_at_epoch": 1385253473, "lesson_id": 3, "created_at_epoch": 1385242895, "user_name": "Student C", "id": 17, "question_id": 29}}, {"response": {"user_id": 4, "lesson_name": "Lesson 1", "created_at": "2013-11-23T13:42:50", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253472, "lesson_id": 1, "created_at_epoch": 1385242970, "user_name": "Student D", "id": 18, "question_id": 4}}, {"response": {"user_id": 4, "lesson_name": "Lesson 2", "created_at": "2013-11-23T13:43:52", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 2, Q2", "updated_at_epoch": 1385253473, "lesson_id": 2, "created_at_epoch": 1385243032, "user_name": "Student D", "id": 19, "question_id": 19}}, {"response": {"user_id": 3, "lesson_name": "Lesson 4", "created_at": "2013-11-23T13:45:36", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 4, Q4", "updated_at_epoch": 1385253473, "lesson_id": 4, "created_at_epoch": 1385243136, "user_name": "Student C", "id": 20, "question_id": 28}}, {"response": {"user_id": 3, "lesson_name": "Lesson 4", "created_at": "2013-11-23T13:46:00", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 4, Q4", "updated_at_epoch": 1385253472, "lesson_id": 4, "created_at_epoch": 1385243160, "user_name": "Student C", "id": 21, "question_id": 10}}, {"response": {"user_id": 3, "lesson_name": "Lesson 1", "created_at": "2013-11-23T13:49:22", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253472, "lesson_id": 1, "created_at_epoch": 1385243362, "user_name": "Student C", "id": 22, "question_id": 7}}, {"response": {"user_id": 4, "lesson_name": "Lesson 4", "created_at": "2013-11-23T13:52:07", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 4, Q4", "updated_at_epoch": 1385253472, "lesson_id": 4, "created_at_epoch": 1385243527, "user_name": "Student D", "id": 23, "question_id": 17}}, {"response": {"user_id": 2, "lesson_name": "Lesson 4", "created_at": "2013-11-23T13:52:14", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 4, Q4", "updated_at_epoch": 1385253472, "lesson_id": 4, "created_at_epoch": 1385243534, "user_name": "Student B", "id": 24, "question_id": 10}}, {"response": {"user_id": 2, "lesson_name": "Lesson 4", "created_at": "2013-11-23T13:55:44", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 4, Q4", "updated_at_epoch": 1385253472, "lesson_id": 4, "created_at_epoch": 1385243744, "user_name": "Student B", "id": 25, "question_id": 17}}, {"response": {"user_id": 1, "lesson_name": "Lesson 1", "created_at": "2013-11-23T14:01:10", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253473, "lesson_id": 1, "created_at_epoch": 1385244070, "user_name": "Student A", "id": 26, "question_id": 30}}, {"response": {"user_id": 2, "lesson_name": "Lesson 2", "created_at": "2013-11-23T14:01:47", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 2, Q2", "updated_at_epoch": 1385253473, "lesson_id": 2, "created_at_epoch": 1385244107, "user_name": "Student B", "id": 27, "question_id": 27}}, {"response": {"user_id": 4, "lesson_name": "Lesson 1", "created_at": "2013-11-23T14:02:13", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253472, "lesson_id": 1, "created_at_epoch": 1385244133, "user_name": "Student D", "id": 28, "question_id": 1}}, {"response": {"user_id": 1, "lesson_name": "Lesson 3", "created_at": "2013-11-23T14:05:13", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 3, Q3", "updated_at_epoch": 1385253472, "lesson_id": 3, "created_at_epoch": 1385244313, "user_name": "Student A", "id": 29, "question_id": 16}}, {"response": {"user_id": 2, "lesson_name": "Lesson 3", "created_at": "2013-11-23T14:08:29", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 3, Q3", "updated_at_epoch": 1385253472, "lesson_id": 3, "created_at_epoch": 1385244509, "user_name": "Student B", "id": 30, "question_id": 11}}, {"response": {"user_id": 5, "lesson_name": "Lesson 1", "created_at": "2013-11-23T14:09:31", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253472, "lesson_id": 1, "created_at_epoch": 1385244571, "user_name": "Student E", "id": 31, "question_id": 4}}, {"response": {"user_id": 5, "lesson_name": "Lesson 3", "created_at": "2013-11-23T14:10:52", "updated_at": "2013-11-23T16:37:52-08:00", "value": "Answer for Lesson 3, Q3", "updated_at_epoch": 1385253472, "lesson_id": 3, "created_at_epoch": 1385244652, "user_name": "Student E", "id": 32, "question_id": 3}}, {"response": {"user_id": 5, "lesson_name": "Lesson 1", "created_at": "2013-11-23T14:12:47", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 1, Q1", "updated_at_epoch": 1385253473, "lesson_id": 1, "created_at_epoch": 1385244767, "user_name": "Student E", "id": 33, "question_id": 30}}, {"response": {"user_id": 5, "lesson_name": "Lesson 3", "created_at": "2013-11-23T14:13:10", "updated_at": "2013-11-23T16:37:53-08:00", "value": "Answer for Lesson 3, Q3", "updated_at_epoch": 1385253473, "lesson_id": 3, "created_at_epoch": 1385244790, "user_name": "Student E", "id": 34, "question_id": 29}}]'
 

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
