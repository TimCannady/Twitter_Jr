############################# index ###########
get '/users/:id/tweets' do
  'displays all user tweets'
end


############################# new ###########
get '/users/:id/tweets/new' do
  # 'renders the create new form'
  @user = User.new
  erb :"tweet/_tweet_new"
end
############################# create
post '/users/:id/tweets' do
  # 'creates the tweet and saves to the database'
  @tweet = Tweet.new(content: params[:content])

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
