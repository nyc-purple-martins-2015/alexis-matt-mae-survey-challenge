get '/surveys/new' do
  erb :"survey/create"
end

post '/surveys/new' do
  @survey = Survey.new(params[:survey])
  @survey.user_id = 1 # HACK FIX ME LATER!!!!
  if @survey.save
    redirect "/surveys/#{@survey.id}/questions/new"
  else
    status 400
    "ERROR. Incorrect User Input. Please try again. "
  end
end

get '/surveys/:survey_id/questions/new' do
  @survey = Survey.find(params[:survey_id])
  erb :"survey/questions"
end

post '/surveys/:survey_id/questions/new' do
  content_type :text
  params.inspect
end
