helpers do

  def sign_up
    user = User.new(email: params[:email])
    user.password = params[:password]
    user.save!
  end

  def login
    user = User.where(email: params[:email]).first
    if user && user.password == params[:password]
      sessions[:id] = params[:id]
    end
  end

  def logout
    sessions[:id] = nil
  end

end
