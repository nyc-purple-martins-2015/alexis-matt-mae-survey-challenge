
get '/surveys/index' do
  @user = User.find(session[:user_id])
  @survey = Survey.new
  erb :'surveys/index'

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  @user = User.find(@survey.user_id)
  erb :"surveys/show"
end

get '/surveys/new' do
  erb :"surveys/create"
end

post '/surveys/new' do
  @survey = Survey.new(params[:survey])
  if @survey.save
    redirect "/surveys/#{@survey.id}/questions/new"
  else
    status 400
    "ERROR. Incorrect User Input. Please try again. "
  end
end

get '/surveys/:survey_id/questions/new' do
  @survey = Survey.find(params[:survey_id])
  erb :"surveys/questions"
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
