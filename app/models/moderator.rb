class Moderator < ActiveRecord::Base
	has_secure_password

	has_many :hang_hoas

	validates :fullname, presence: true
	validates :username, presence: true, format: { with: /@/, message: 'is not valid' }
	validates :password, presence: true
end
