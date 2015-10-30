get '/create-survey' do
  erb :"survey/create"
end

post '/create-survey' do
  @survey = Survey.new(params[:survey])
  @survey.user_id = 1 # HACK FIX ME LATER!!!!
  if @survey.save
    redirect "/create-survey/#{@survey.id}/create-questions"
  else
    status 400
    "ERROR. Incorrect User Input. Please try again. "
  end
end

get '/create-survey/:survey_id/create-questions' do
  @survey = Survey.find(params[:survey_id])
  erb :"survey/questions"
end

post '/create_survey/:survey_id/create-questions' do
  content_type :text
  params.inspect
end
