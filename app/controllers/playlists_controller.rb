class PlaylistsController < ApplicationController


	def create
		user = User.find(current_user.id)
		song = Song.find(params[:song_id])
		listed = Playlist.where(user_id: user.id, song_id: song.id).first
		if listed
			listed.increment!(:count)
			song.increment!(:count)
		else
			Playlist.create(user_id: user.id, song_id: song.id, count: 1)
			song.increment!(:count)
		end
		redirect_to songs_path
	end
end
