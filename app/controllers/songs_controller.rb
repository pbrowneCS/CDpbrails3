class SongsController < ApplicationController
	def index
		@user = current_user
		@songs = Song.all
		@playlist = Playlist.all
	end

	def show
		@song = Song.find(params[:id])
		@playlist = Playlist.where(song_id:params[:id])
	end

	def create
		@song = Song.new(song_params)
		if @song.save
			redirect_to songs_path(current_user.id)
		else
			flash[:errors] = @song.errors.full_messages
			redirect_to songs_path(current_user.id)
		end
	end


	private
	def song_params
		params.require(:song).permit(:count, :artist, :title)
	end
end
