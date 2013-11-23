get '/' do
  @students=User.where(role: "student")
  @questions = Question.all
  @responses = Response.all

  # if xhr
  #   content_type :json

  #   return @responses.to_json
  # # end
    erb :index
end

get '/responses' do

   @responses = Response.all

  # if xhr
   content_type :json
  @responses.to_json
  # end
 
end
