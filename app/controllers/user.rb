
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
  @users = User.all
  erb :'user/user_index'
end

get '/users/:id' do
  @current_profile_id = params[:id].to_i
  # This shows the profile of a user
  if session[:user_id]
    @users_tweets = current_user.tweets
    users_following = current_user.leaders
    users_following_tweets = []

    users_following.each do |user|
      users_following_tweets << user.tweets
    end
    p '###########################'
    @user_and_following_tweets = users_following_tweets + @users_tweets
    erb :'user/user_show'
  else
    redirect '/'
  end
end

delete '/users/:id' do
  UserRelationship.find_by(leader_id: params[:id], minion_id: current_user.id).destroy
  redirect "/users/#{params[:id]}"
end

post '/users/:id' do
  UserRelationship.create!(leader_id: params[:id], minion_id: current_user.id)
  redirect "/users/#{params[:id]}"
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

