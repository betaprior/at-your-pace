require 'json'


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

get '/lessons' do
  @lessons = Lesson.all
  content_type :json
  @lessons.to_json
end


get '/responses' do

   @responses = Response.all

  content_type :json
  # this json -> hash -> json process is probably suboptimal
  resp_json = @responses.to_json(:methods => [:epoch_time, :user_name, :lesson_name, :lesson_id])
  resp_hash = JSON.parse(resp_json).map  { |x| x["response"] }
  resp_hash.to_json
 
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
  testjson = JSON.parse(IO.read('public/js/responses1.json')) 
  content_type :json
  testjson = testjson.map do |x| 
    ts = x["response"]["created_at"]
    epoch = Time.strptime(ts, '%Y-%m-%dT%H:%M:%S').strftime('%s')
    x["response"].merge!({:epoch_time => epoch})
  end
  testjson.to_json

end
