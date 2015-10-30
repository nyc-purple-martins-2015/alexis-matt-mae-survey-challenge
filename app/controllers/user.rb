get '/login' do
  @user = User.new
  erb :"users/login"
end

post '/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/surveys/index'
  else
    @error = "Incorrect username or password."
    erb :"users/login"
  end
end

post '/signup' do
  @user = User.new(username: params[:new_user][:username])
  @user.password = params[:new_user][:password]
  if @user.save
    session[:user_id] = @user.id
    redirect '/create-survey'
  else
    @error = "Bad signup!"
    erb :"users/login"
  end
end

get '/logout' do
  session.clear
  redirect "/login"
end

get '/users/:id' do |id|
  @user = User.find(id)
  erb :"users/profile"
end
