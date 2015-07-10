############################# index ###########
get '/users/:id/tweets' do
  # 'displays all user tweets'
  p 'in get /tweets route'
  @tweets = Tweet.all
  erb :"tweet/_tweet_list"
end


############################# new ###########
get '/users/:id/tweets/new' do
  # 'renders the create new form'
  @user = User.find_by(id: params[:id])
  erb :"tweet/_tweet_new"
end
############################# create
post '/users/:id/tweets' do
  # 'creates the tweet and saves to the database'
  p 'in post /tweets'
  p params
  p '#' * 50
  @user = User.find_by(id: params[:id])
  @tweet = Tweet.new(content: params[:content], user_id: session[:user_id])
  if @tweet.save
    # p 'this saved!'
    redirect "/users/#{@user.id}/tweets"
  else
    p 'this did not save'
  end
end


############################# show ###########
get '/users/:id/tweets/:tweets_id' do
  'shows a specific tweet'
end


############################# edit ###########
get '/users/:id/tweets/:tweets_id/edit' do
  'renders the edit form'
end
############################# update
put '/users/:id/tweets/:tweets_id' do
  'updates the database with the revised information'
end


############################# delete ###########
delete '/users/:id/tweets/:tweets_id' do
  'destroys the tweed in the database'
end
