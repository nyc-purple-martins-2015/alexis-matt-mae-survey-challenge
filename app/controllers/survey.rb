get '/surveys' do
  @user = User.find(session[:user_id])
  @survey = Survey.new
  erb :'surveys/home'
end

get '/surveys/index' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/new' do
  @survey = Survey.new
  erb :"surveys/create"
end

post '/surveys/new' do # ask about refactoring our crazy survey creation
  @user = find_user
  @survey = Survey.new(title: params[:survey][:title], description: params[:survey][:description], user_id: @user.id)
  if @survey.save
    redirect "/surveys/#{@survey.id}/questions/new"
  else
    status 400
    "ERROR. Incorrect User Input. Please try again. "
  end
end

# get '/surveys/:id' do
#   @survey = Survey.find(params[:id])
#   @questions = @survey.questions
#   @user = User.find(@survey.user_id)
#   erb :"surveys/show"
# end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  @user = User.find(session[:user_id])
  @questions = @survey.questions
  erb :"surveys/take"
end

post '/surveys/:id' do
  @survey = Survey.find(params[:id])
  @user = User.find(session[:user_id])
  @questions = @survey.questions
  # @user_responses = params[:userresponses][:choice]
  binding.pry
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

