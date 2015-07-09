get '/' do
  erb :'landing'
end

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


# have users var as the new user
# query the database by email
# users.last.email == user.email
#
# if user && user.
