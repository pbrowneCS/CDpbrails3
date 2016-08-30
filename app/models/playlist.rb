class Playlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  validates :user_id, :song_id, :count, presence:true
end
