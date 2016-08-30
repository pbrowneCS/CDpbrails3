class User < ActiveRecord::Base
  has_secure_password
    validates :first_name, :last_name, :password, :email, presence:true
    validates_length_of :password, minimum: 8
    validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    validates :email.downcase, uniqueness:true
    validates_confirmation_of :password, message: "Password must match"
    has_many :playlists
end
