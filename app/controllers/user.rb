
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

  if session[:user_id] == params[:id].to_i

    @users_tweets = current_user.tweets
    users_following = current_user.leaders
    users_following_tweets = []

    users_following.each do |user|
      users_following_tweets << user.tweets
    end

    @user_and_following_tweets = users_following_tweets + @users_tweets
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

