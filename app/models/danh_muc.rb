class DanhMuc < ActiveRecord::Base
	has_many :hang_hoas, through: :danh_muc_hang_hoas
end
