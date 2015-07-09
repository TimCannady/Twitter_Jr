helpers do

  def sign_up
    user = User.new(email: params[:email])
    user.password = params[:password]
    user.save!
  end

  def login
    user = User.where(email: params[:email]).first
    if user && user.password == params[:password]
      sessions[:user_id] = params[:user_id]
    end
  end

  def logout
    sessions[:user_id] = nil
  end

end

