class DanhMuc < ActiveRecord::Base
	has_many :hang_hoas

	validates :ten_danh_muc, presence: true

	def dang_su_dung?
		HangHoa.exists?(danh_muc_id: self.id)
	end
end
