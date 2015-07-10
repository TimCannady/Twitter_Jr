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

# post or get?
post '/logout' do
  logout
end


