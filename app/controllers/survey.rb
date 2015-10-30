get '/surveys/index' do
  @user = User.find(session[:user_id])
  @survey = Survey.new
  erb :'surveys/index'
end

get '/surveys/new' do
  erb :"surveys/create"
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
  @survey = Survey.find(params[:survey_id])
  survey_id = @survey.id
  @question = Question.create(prompt: params[:question][:prompt], survey_id: survey_id)
  @choice_array = params[:question][:choice]
  @choice_array.each do |choice|
    Choice.create(selection: choice, question_id: @question.id)
  end
  redirect "/surveys/#{@survey.id}/questions/new"
end
