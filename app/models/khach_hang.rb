class KhachHang < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  	has_many :don_hangs
  	
  	devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

    accepts_nested_attributes_for 	:don_hangs,
									allow_destroy: true
end
