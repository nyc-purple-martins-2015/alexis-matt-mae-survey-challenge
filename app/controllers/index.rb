get '/' do
  if logged_in?
    redirect '/surveys/index'
  else
    redirect '/login'
  end
end
