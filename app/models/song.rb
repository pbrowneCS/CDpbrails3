class Song < ActiveRecord::Base
	validates :title, :artist, :count, presence:true
	validates_length_of :title, :artist, minimum: 2
	has_many :playlists
end
