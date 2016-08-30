class SessionsController < ApplicationController


  def create
  	user = User.find_by_email(user_params[:email])
  	if user && user.authenticate(user_params[:password])
  		session[:user_id] = user.id.to_i
  		redirect_to songs_path
  	else 
  		redirect_to "/", notice: "Invalid"
  	end
  end

  def destroy
  	session.clear
  	redirect_to "/"
  end
  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
