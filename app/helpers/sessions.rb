helpers do

  def sign_up
    p "got here"
    @user = User.new(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], username: params[:username])
    @user.password = params[:password]
    @user.save!
  end

  def login
    @user = User.where(email: params[:email]).first
    if @user && @user.password == params[:password]
      session[:user_id] = params[:user_id]
    end
  end

  def logout
    session[:user_id] = nil
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.where(id: session[:user_id]).first
    end
  end

end
