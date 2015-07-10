
post '/users/new' do
  sign_up
  login
  redirect "/home"
end

#/login or /users/login?
post '/login' do
  login
  redirect "/home"
end

get '/logout' do
  logout
  redirect "/"
end

get '/users' do
  redirect '/home'
end


get '/users/:id' do
  # This shows the profile of a user
  if session[:user_id]
    erb :'user/user_show'
  else
    redirect '/'
  end

end

get '/users/:id/followers' do

end

get '/users/:id/following' do

end

get '/home' do
  if session[:user_id]
    erb :home
  else
    redirect '/'
  end
end

post '/search' do
  redirect '/users/search_results'
end

get '/users/search_results' do

end

