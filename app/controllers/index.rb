get '/' do
  if logged_in?
    redirect '/surveys'
  else
    redirect '/login'
  end
end
