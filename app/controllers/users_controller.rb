class UsersController < ApplicationController

	def main
	end

	def show
		@user = User.find(params[:id])
		@playlists = Playlist.where(user_id:params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to songs_path
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to "/"
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name)
	end
end
